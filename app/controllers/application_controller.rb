class ApplicationController < ActionController::Base

  # セキュリティ関連の記述
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # sign_upとaccount_updateで、ストロングパラメーターに「name」カラムを追加できるようになる。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end
