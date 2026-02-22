"""
MorphologicalOps - Texture Transformations for Generative Evolution

This module provides morphological operations on RGBA textures for the
generative evolution system. These operations simulate genetic transformations:

- erode_texture: Remove isolated pixels (dead code elimination)
- dilate_texture: Expand pixel clusters (redundancy)
- blur_texture: Gaussian blur (probabilistic execution)
- sharpen_texture: Unsharp mask (determinism)
- convolve_texture: Custom kernel application

Texture format: np.ndarray shape (H, W, 4), dtype uint8 (RGBA)
"""

import logging
from typing import Optional

import numpy as np
from scipy.ndimage import (
    binary_erosion,
    binary_dilation,
    gaussian_filter,
    grey_erosion,
    grey_dilation,
    convolve
)

logger = logging.getLogger(__name__)


def _validate_texture(texture: np.ndarray) -> np.ndarray:
    """
    Validate and prepare texture for morphological operations.

    Args:
        texture: Input texture array

    Returns:
        Validated texture array

    Raises:
        ValueError: If texture has invalid shape or dtype
    """
    if texture.ndim != 3:
        raise ValueError(f"Texture must be 3D (H, W, C), got shape {texture.shape}")

    if texture.shape[2] != 4:
        raise ValueError(f"Texture must have 4 channels (RGBA), got {texture.shape[2]}")

    if texture.dtype != np.uint8:
        raise ValueError(f"Texture must be uint8, got {texture.dtype}")

    return texture


def _ensure_float64(texture: np.ndarray) -> np.ndarray:
    """
    Convert texture to float64 for precise operations.

    Args:
        texture: Input texture array

    Returns:
        Texture as float64 array
    """
    return texture.astype(np.float64)


def _ensure_uint8(texture: np.ndarray) -> np.ndarray:
    """
    Convert texture back to uint8, clipping values to valid range.

    Args:
        texture: Input texture array (any dtype)

    Returns:
        Texture as uint8 array with values in [0, 255]
    """
    # Clip to valid range and convert
    return np.clip(texture, 0, 255).astype(np.uint8)


def erode_texture(texture: np.ndarray, kernel_size: int = 3) -> np.ndarray:
    """
    Erode texture by removing isolated pixels (dead code elimination).

    Erosion shrinks bright regions using the minimum value in the kernel
    neighborhood. This simulates dead code elimination by removing isolated
    pixels that lack neighboring support.

    Args:
        texture: Input texture as (H, W, 4) uint8 array (RGBA)
        kernel_size: Size of erosion kernel (default: 3)

    Returns:
        Eroded texture as (H, W, 4) uint8 array

    Example:
        >>> texture = np.full((4, 4, 4), 255, dtype=np.uint8)
        >>> texture[0, 0] = 0  # Isolated black pixel
        >>> eroded = erode_texture(texture, kernel_size=3)
    """
    _validate_texture(texture)

    if kernel_size < 1:
        raise ValueError(f"kernel_size must be >= 1, got {kernel_size}")

    result = np.zeros_like(texture)

    # Apply grey erosion to each channel
    # Grey erosion: each pixel becomes minimum of its neighborhood
    for c in range(4):
        eroded = grey_erosion(texture[:, :, c], size=kernel_size)
        result[:, :, c] = eroded

    return result


def dilate_texture(texture: np.ndarray, kernel_size: int = 3) -> np.ndarray:
    """
    Dilate texture by expanding pixel clusters (redundancy).

    Dilation expands pixels by setting all pixels in the kernel neighborhood
    to the maximum value in that neighborhood, simulating redundancy.

    Args:
        texture: Input texture as (H, W, 4) uint8 array (RGBA)
        kernel_size: Size of dilation kernel (default: 3)

    Returns:
        Dilated texture as (H, W, 4) uint8 array

    Example:
        >>> texture = np.zeros((4, 4, 4), dtype=np.uint8)
        >>> texture[1, 1] = [255, 255, 255, 255]
        >>> dilated = dilate_texture(texture, kernel_size=3)
        # Adjacent pixels are now also white
    """
    _validate_texture(texture)

    if kernel_size < 1:
        raise ValueError(f"kernel_size must be >= 1, got {kernel_size}")

    # Create dilation kernel (structuring element)
    structure = np.ones((kernel_size, kernel_size), dtype=bool)

    result = np.zeros_like(texture)

    # Apply dilation to each channel
    for c in range(4):
        # Grey dilation: each pixel becomes max of its neighborhood
        dilated = grey_dilation(texture[:, :, c], size=kernel_size)
        result[:, :, c] = dilated

    return result


def blur_texture(texture: np.ndarray, sigma: float = 1.0) -> np.ndarray:
    """
    Apply Gaussian blur to texture (probabilistic execution).

    Gaussian blur simulates probabilistic execution by spreading pixel
    values across their neighborhood.

    Args:
        texture: Input texture as (H, W, 4) uint8 array (RGBA)
        sigma: Standard deviation of Gaussian kernel (default: 1.0)

    Returns:
        Blurred texture as (H, W, 4) uint8 array

    Example:
        >>> texture = np.random.randint(0, 256, (10, 10, 4), dtype=np.uint8)
        >>> blurred = blur_texture(texture, sigma=1.5)
    """
    _validate_texture(texture)

    if sigma < 0:
        raise ValueError(f"sigma must be >= 0, got {sigma}")

    # Convert to float for precise filtering
    float_texture = _ensure_float64(texture)

    result = np.zeros_like(float_texture)

    # Apply Gaussian filter to each channel
    for c in range(4):
        # sigma=0 has minimal effect
        if sigma > 0:
            blurred = gaussian_filter(float_texture[:, :, c], sigma=sigma)
            result[:, :, c] = blurred
        else:
            result[:, :, c] = float_texture[:, :, c]

    return _ensure_uint8(result)


def sharpen_texture(texture: np.ndarray, amount: float = 1.0) -> np.ndarray:
    """
    Sharpen texture using unsharp mask (determinism).

    Unsharp mask enhances local contrast by subtracting a blurred version
    from the original, simulating increased determinism.

    Formula: sharpened = original + amount * (original - blurred)

    Args:
        texture: Input texture as (H, W, 4) uint8 array (RGBA)
        amount: Sharpening strength (default: 1.0)

    Returns:
        Sharpened texture as (H, W, 4) uint8 array

    Example:
        >>> texture = np.random.randint(0, 256, (10, 10, 4), dtype=np.uint8)
        >>> sharpened = sharpen_texture(texture, amount=1.5)
    """
    _validate_texture(texture)

    if amount < 0:
        raise ValueError(f"amount must be >= 0, got {amount}")

    # Convert to float for precise operations
    float_texture = _ensure_float64(texture)

    result = np.zeros_like(float_texture)

    # Apply unsharp mask to each channel
    for c in range(4):
        channel = float_texture[:, :, c]

        # Create blurred version (sigma=1.0 for unsharp mask)
        blurred = gaussian_filter(channel, sigma=1.0)

        # Unsharp mask: original + amount * (original - blurred)
        sharpened = channel + amount * (channel - blurred)

        result[:, :, c] = sharpened

    return _ensure_uint8(result)


def convolve_texture(texture: np.ndarray, kernel: np.ndarray) -> np.ndarray:
    """
    Apply custom convolution kernel to texture.

    Convolution applies a custom kernel to each pixel, computing the
    weighted sum of the pixel's neighborhood.

    Args:
        texture: Input texture as (H, W, 4) uint8 array (RGBA)
        kernel: Convolution kernel as 2D array

    Returns:
        Convolved texture as (H, W, 4) uint8 array

    Example:
        >>> # Identity kernel (no change)
        >>> kernel = np.array([[0, 0, 0],
        ...                    [0, 1, 0],
        ...                    [0, 0, 0]])
        >>> result = convolve_texture(texture, kernel)
        >>>
        >>> # Edge detection
        >>> kernel = np.array([[-1, -1, -1],
        ...                    [-1,  8, -1],
        ...                    [-1, -1, -1]])
        >>> edges = convolve_texture(texture, kernel)
        >>>
        >>> # Box blur
        >>> kernel = np.ones((3, 3)) / 9.0
        >>> blurred = convolve_texture(texture, kernel)
    """
    _validate_texture(texture)

    if kernel.ndim != 2:
        raise ValueError(f"Kernel must be 2D, got {kernel.ndim} dimensions")

    if kernel.shape[0] != kernel.shape[1]:
        logger.warning(f"Kernel is not square: {kernel.shape}")

    # Convert to float for precise convolution
    float_texture = _ensure_float64(texture)

    result = np.zeros_like(float_texture)

    # Apply convolution to each channel
    for c in range(4):
        # Convolve with the kernel
        convolved = convolve(float_texture[:, :, c], kernel, mode='constant', cval=0.0)
        result[:, :, c] = convolved

    return _ensure_uint8(result)


# Convenience functions for common operations

def opening(texture: np.ndarray, kernel_size: int = 3) -> np.ndarray:
    """
    Morphological opening: erosion followed by dilation.

    Opening removes small objects and noise while preserving larger structures.

    Args:
        texture: Input texture as (H, W, 4) uint8 array (RGBA)
        kernel_size: Size of structuring element (default: 3)

    Returns:
        Opened texture as (H, W, 4) uint8 array
    """
    eroded = erode_texture(texture, kernel_size=kernel_size)
    return dilate_texture(eroded, kernel_size=kernel_size)


def closing(texture: np.ndarray, kernel_size: int = 3) -> np.ndarray:
    """
    Morphological closing: dilation followed by erosion.

    Closing fills small holes and gaps while preserving larger structures.

    Args:
        texture: Input texture as (H, W, 4) uint8 array (RGBA)
        kernel_size: Size of structuring element (default: 3)

    Returns:
        Closed texture as (H, W, 4) uint8 array
    """
    dilated = dilate_texture(texture, kernel_size=kernel_size)
    return erode_texture(dilated, kernel_size=kernel_size)


def gradient(texture: np.ndarray, kernel_size: int = 3) -> np.ndarray:
    """
    Morphological gradient: dilation minus erosion.

    Gradient highlights edges and boundaries in the texture.

    Args:
        texture: Input texture as (H, W, 4) uint8 array (RGBA)
        kernel_size: Size of structuring element (default: 3)

    Returns:
        Gradient texture as (H, W, 4) uint8 array
    """
    dilated = dilate_texture(texture, kernel_size=kernel_size)
    eroded = erode_texture(texture, kernel_size=kernel_size)

    # Subtract and ensure valid range
    result = dilated.astype(np.int16) - eroded.astype(np.int16)
    return np.clip(result, 0, 255).astype(np.uint8)


# Common kernels for convenience

KERNELS = {
    'identity_3x3': np.array([[0, 0, 0],
                              [0, 1, 0],
                              [0, 0, 0]]),

    'box_blur_3x3': np.ones((3, 3)) / 9.0,

    'gaussian_3x3': np.array([[1, 2, 1],
                               [2, 4, 2],
                               [1, 2, 1]]) / 16.0,

    'sharpen_3x3': np.array([[0, -1, 0],
                              [-1, 5, -1],
                              [0, -1, 0]]),

    'edge_detection_3x3': np.array([[-1, -1, -1],
                                     [-1, 8, -1],
                                     [-1, -1, -1]]),

    'sobel_x': np.array([[-1, 0, 1],
                         [-2, 0, 2],
                         [-1, 0, 1]]),

    'sobel_y': np.array([[-1, -2, -1],
                         [0, 0, 0],
                         [1, 2, 1]]),

    'emboss': np.array([[-2, -1, 0],
                        [-1, 1, 1],
                        [0, 1, 2]]),

    'laplacian': np.array([[0, 1, 0],
                           [1, -4, 1],
                           [0, 1, 0]]),
}


def get_kernel(name: str) -> np.ndarray:
    """
    Get a predefined kernel by name.

    Available kernels:
    - identity_3x3: No change
    - box_blur_3x3: Simple box blur
    - gaussian_3x3: Gaussian blur approximation
    - sharpen_3x3: Sharpening kernel
    - edge_detection_3x3: Edge detection
    - sobel_x: Horizontal edge detection
    - sobel_y: Vertical edge detection
    - emboss: Emboss effect
    - laplacian: Laplacian edge detection

    Args:
        name: Name of the kernel

    Returns:
        Kernel as 2D numpy array

    Raises:
        KeyError: If kernel name not found
    """
    if name not in KERNELS:
        available = ', '.join(KERNELS.keys())
        raise KeyError(f"Unknown kernel '{name}'. Available: {available}")

    return KERNELS[name].copy()


if __name__ == "__main__":
    # Example usage
    import matplotlib.pyplot as plt

    # Create a sample texture
    texture = np.zeros((64, 64, 4), dtype=np.uint8)

    # Add some shapes
    texture[10:20, 10:20] = [255, 0, 0, 255]  # Red square
    texture[30:35, 30:35] = [0, 255, 0, 255]  # Green square (smaller)
    texture[40:50, 40:50] = [0, 0, 255, 255]  # Blue square

    # Add some noise
    texture[5, 5] = [255, 255, 255, 255]
    texture[55, 55] = [255, 255, 255, 255]

    # Apply operations
    eroded = erode_texture(texture, kernel_size=3)
    dilated = dilate_texture(texture, kernel_size=3)
    blurred = blur_texture(texture, sigma=1.5)
    sharpened = sharpen_texture(texture, amount=1.5)

    # Display results (if matplotlib available)
    try:
        fig, axes = plt.subplots(2, 3, figsize=(12, 8))

        axes[0, 0].imshow(texture)
        axes[0, 0].set_title('Original')
        axes[0, 0].axis('off')

        axes[0, 1].imshow(eroded)
        axes[0, 1].set_title('Eroded')
        axes[0, 1].axis('off')

        axes[0, 2].imshow(dilated)
        axes[0, 2].set_title('Dilated')
        axes[0, 2].axis('off')

        axes[1, 0].imshow(blurred)
        axes[1, 0].set_title('Blurred')
        axes[1, 0].axis('off')

        axes[1, 1].imshow(sharpened)
        axes[1, 1].set_title('Sharpened')
        axes[1, 1].axis('off')

        # Morphological gradient
        grad = gradient(texture, kernel_size=3)
        axes[1, 2].imshow(grad)
        axes[1, 2].set_title('Gradient')
        axes[1, 2].axis('off')

        plt.tight_layout()
        plt.savefig('morphological_ops_example.png', dpi=150)
        logger.info("Saved example to morphological_ops_example.png")
    except ImportError:
        logger.warning("matplotlib not available, skipping visualization")
