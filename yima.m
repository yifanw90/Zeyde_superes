function ReconIm = yima(lowIm)
% Image super-resolution using sparse representation
% Example code
%
% Nov. 2, 2007. Jianchao Yang
% IFP @ UIUC
%
% Revised version. April, 2009.
%
% Reference
% Jianchao Yang, John Wright, Thomas Huang and Yi Ma. Image superresolution
% via sparse representation of raw image patches. IEEE Computer Society
% Conference on Computer Vision and Pattern Recognition (CVPR), 2008. 
%
% For any questions, email me by jyang29@illinois.edu
d = './CVPR08-SR';
addpath(d, [d '/Solver'], [d '/Sparse coding']);
% =====================================================================
% specify the parameter settings
patch_size = 3; % patch size for the low resolution input image
overlap = 2; % overlap between adjacent patches
lambda = 0.1; % sparsity parameter
zooming = 3; % zooming factor, if you change this, the dictionary needs to be retrained.
regres = 'L1'; % 'L1' or 'L2', use the sparse representation directly, or use the supports for L2 regression
% =====================================================================
% training coupled dictionaries for super-resolution
load([d '/Data/Dictionary/Dictionary.mat']);
% ======================================================================
% Super-resolution using sparse representation
disp('Start superresolution...');
ReconIm = L1SR(lowIm, zooming, patch_size, overlap, Dh, Dl, lambda, regres);
