class FavoritesController < ApplicationController
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = "ツイートをいいねしました。"
    redirect_to root_path
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    @user = User.find(micropost.user_id)
    current_user.unfavorite(micropost)
    flash[:success] = 'いいねを解除しました。'
    redirect_to root_path
  end
end
