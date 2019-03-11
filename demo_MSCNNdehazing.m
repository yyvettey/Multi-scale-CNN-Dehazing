clear;close all; clc;
addpath(genpath('.'));

% This MatConvNet is compiled under Win7, you can also compile MatConvNet
% under Linux, Mac, and Windows, then run our "demo_MSCNNdehazing.m".

% run(fullfile(fileparts(mfilename('fullpath')), './matlab/vl_setupnn.m')) ;
run(fullfile('/home/yeyuan/matconvnet-1.0-beta25/matlab/vl_setupnn')) ;

% if the input is very hazy, use large gamma to amend T. (0.8-1.5)

% hazy_path = './testimgs/';
% img = 'example-04-haze.png'; 
gamma = 1; % 
% img = 'newyork.png'; gamma = 1.0;
% img = 'IMG_0752.png'; gamma = 1.3;
% img = 'canyon.png'; gamma = 1.3;

hazy_path = '/ssd2/yeyuan/dehaze/RTTS/JPEGImages/';
dehaze_path = '/ssd2/yeyuan/dehaze/RTTS/JPEGImages_mscnn/';

files = dir(strcat(hazy_path, '*.png'));

for file = files'
    disp(file.name)
    imagename = [hazy_path file.name];
    dehazename = [dehaze_path file.name];
    
    dehazedImageRGB = mscnndehazing(imagename, dehazename, gamma);      
end

disp("====== happy ending ======")


