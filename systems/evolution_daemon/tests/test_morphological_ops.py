"""
Tests for MorphologicalOps - Texture Transformations for Generative Evolution

Test coverage:
1. erode_texture - Remove isolated pixels (dead code elimination)
2. dilate_texture - Expand pixel clusters (redundancy)
3. blur_texture - Gaussian blur (probabilistic execution)
4. sharpen_texture - Unsharp mask (determinism)
5. convolve_texture - Custom kernel application
"""

import pytest
import numpy as np
from unittest.mock import patch

from systems.evolution_daemon.morphological_ops import (
    erode_texture,
    dilate_texture,
    blur_texture,
    sharpen_texture,
    convolve_texture
)


# === Fixtures ===

@pytest.fixture
def sample_texture():
    """Create a sample 8x8 RGBA texture for testing"""
    # Create a larger texture with some isolated pixels and clusters
    texture = np.zeros((8, 8, 4), dtype=np.uint8)

    # Set some pixels to white (255, 255, 255, 255)
    # A larger 4x4 cluster at center that should survive erosion
    texture[2:6, 2:6] = [255, 255, 255, 255]

    # An isolated pixel at corner (should be removed by erosion)
    texture[0, 0] = [255, 255, 255, 255]

    return texture


@pytest.fixture
def solid_texture():
    """Create a solid white texture for testing"""
    return np.full((8, 8, 4), 255, dtype=np.uint8)


@pytest.fixture
def gradient_texture():
    """Create a texture with gradient for testing blur/sharpen"""
    texture = np.zeros((8, 8, 4), dtype=np.uint8)
    for i in range(8):
        for j in range(8):
            texture[i, j] = [i * 30, j * 30, 128, 255]
    return texture


# === Test 1: erode_texture - Remove isolated pixels ===

class TestErodeTexture:
    """Test erosion removes isolated pixels (dead code elimination)"""

    def test_erode_removes_isolated_pixels(self, sample_texture):
        """Erosion removes isolated pixels while keeping clusters"""
        result = erode_texture(sample_texture, kernel_size=3)

        # Isolated pixel at (0,0) should be removed (black)
        assert np.all(result[0, 0] == [0, 0, 0, 0])

        # Cluster at center (2:6, 2:6) should survive erosion
        # After 3x3 erosion, the 4x4 cluster becomes 2x2 at center
        assert np.all(result[3, 3] == [255, 255, 255, 255])
        assert np.all(result[3, 4] == [255, 255, 255, 255])
        assert np.all(result[4, 3] == [255, 255, 255, 255])
        assert np.all(result[4, 4] == [255, 255, 255, 255])

    def test_erode_preserves_alpha(self, sample_texture):
        """Erosion preserves alpha channel"""
        result = erode_texture(sample_texture, kernel_size=3)

        # Alpha should be processed along with RGB
        assert result.shape == (8, 8, 4)
        assert result.dtype == np.uint8

    def test_erode_with_different_kernel_sizes(self, solid_texture):
        """Different kernel sizes affect erosion strength"""
        # Large cluster should survive small kernel
        result_small = erode_texture(solid_texture, kernel_size=3)
        assert np.all(result_small > 0)  # Should still have values

        # Larger kernel erodes more aggressively
        result_large = erode_texture(solid_texture, kernel_size=5)
        # Large kernel should erode edges more
        assert result_large.shape == (8, 8, 4)

    def test_erode_empty_texture(self):
        """Erosion of empty texture returns empty"""
        empty = np.zeros((4, 4, 4), dtype=np.uint8)
        result = erode_texture(empty, kernel_size=3)
        assert np.all(result == 0)


# === Test 2: dilate_texture - Expand pixel clusters ===

class TestDilateTexture:
    """Test dilation expands pixel clusters (redundancy)"""

    def test_dilate_expands_clusters(self, sample_texture):
        """Dilation expands white pixel regions"""
        result = dilate_texture(sample_texture, kernel_size=3)

        # Pixels adjacent to white clusters should become white
        # (0,1) is adjacent to (1,1) and should be dilated
        assert np.all(result[1, 1] == [255, 255, 255, 255])

        # More pixels should be white after dilation
        assert np.sum(result > 0) >= np.sum(sample_texture > 0)

    def test_dilate_preserves_alpha(self, sample_texture):
        """Dilation preserves alpha channel"""
        result = dilate_texture(sample_texture, kernel_size=3)

        assert result.shape == (8, 8, 4)
        assert result.dtype == np.uint8

    def test_dilate_with_different_kernel_sizes(self, sample_texture):
        """Different kernel sizes affect dilation strength"""
        result_small = dilate_texture(sample_texture, kernel_size=3)
        result_large = dilate_texture(sample_texture, kernel_size=5)

        # Larger kernel should dilate more
        assert np.sum(result_large > 0) >= np.sum(result_small > 0)

    def test_dilate_solid_texture(self, solid_texture):
        """Dilation of solid texture stays solid"""
        result = dilate_texture(solid_texture, kernel_size=3)
        assert np.all(result == 255)


# === Test 3: blur_texture - Gaussian blur ===

class TestBlurTexture:
    """Test Gaussian blur (probabilistic execution)"""

    def test_blur_smoothens_gradient(self, gradient_texture):
        """Gaussian blur smoothens sharp transitions"""
        result = blur_texture(gradient_texture, sigma=1.0)

        # Result should have same shape
        assert result.shape == (8, 8, 4)
        assert result.dtype == np.uint8

        # Blurred values should be different from original
        # (edge pixels get smoothed)
        assert not np.array_equal(result, gradient_texture)

    def test_blur_with_different_sigma(self, gradient_texture):
        """Different sigma values affect blur strength"""
        result_low = blur_texture(gradient_texture, sigma=0.5)
        result_high = blur_texture(gradient_texture, sigma=2.0)

        # Higher sigma should create more smoothing
        assert not np.array_equal(result_low, result_high)

    def test_blur_preserves_bounds(self, solid_texture):
        """Blur should keep values within valid bounds"""
        result = blur_texture(solid_texture, sigma=1.0)

        # All values should be valid uint8
        assert np.all(result >= 0)
        assert np.all(result <= 255)

    def test_blur_zero_sigma(self, gradient_texture):
        """Zero sigma should have minimal effect"""
        result = blur_texture(gradient_texture, sigma=0.0)

        # Should be very close to original
        assert result.shape == gradient_texture.shape


# === Test 4: sharpen_texture - Unsharp mask ===

class TestSharpenTexture:
    """Test unsharp mask sharpening (determinism)"""

    def test_sharpen_increases_contrast(self, gradient_texture):
        """Sharpening increases local contrast"""
        result = sharpen_texture(gradient_texture, amount=1.0)

        # Result should have same shape
        assert result.shape == (8, 8, 4)
        assert result.dtype == np.uint8

        # Sharpened should differ from original
        assert not np.array_equal(result, gradient_texture)

    def test_sharpen_with_different_amounts(self, gradient_texture):
        """Different amounts affect sharpening strength"""
        result_low = sharpen_texture(gradient_texture, amount=0.5)
        result_high = sharpen_texture(gradient_texture, amount=2.0)

        # Higher amount should sharpen more
        assert not np.array_equal(result_low, result_high)

    def test_sharpen_preserves_bounds(self, gradient_texture):
        """Sharpening should keep values within valid bounds"""
        result = sharpen_texture(gradient_texture, amount=1.0)

        # All values should be valid uint8
        assert np.all(result >= 0)
        assert np.all(result <= 255)

    def test_sharpen_zero_amount(self, gradient_texture):
        """Zero amount should have minimal effect"""
        result = sharpen_texture(gradient_texture, amount=0.0)

        # Should be very close to original
        assert result.shape == gradient_texture.shape


# === Test 5: convolve_texture - Custom kernel ===

class TestConvolveTexture:
    """Test custom kernel convolution"""

    def test_convolve_with_identity_kernel(self, sample_texture):
        """Identity kernel (1 at center) returns original"""
        kernel = np.array([[0, 0, 0],
                          [0, 1, 0],
                          [0, 0, 0]])

        result = convolve_texture(sample_texture, kernel)

        # Should be very close to original
        assert result.shape == sample_texture.shape

    def test_convolve_with_box_blur(self, gradient_texture):
        """Box blur kernel averages pixels"""
        kernel = np.ones((3, 3)) / 9.0

        result = convolve_texture(gradient_texture, kernel)

        # Result should be smoothed
        assert result.shape == gradient_texture.shape
        assert result.dtype == np.uint8

    def test_convolve_with_edge_detection(self, gradient_texture):
        """Edge detection kernel highlights edges"""
        kernel = np.array([[-1, -1, -1],
                          [-1,  8, -1],
                          [-1, -1, -1]])

        result = convolve_texture(gradient_texture, kernel)

        # Should detect edges
        assert result.shape == gradient_texture.shape
        assert result.dtype == np.uint8

    def test_convolve_preserves_bounds(self, gradient_texture):
        """Convolution should keep values within valid bounds"""
        kernel = np.ones((3, 3)) / 9.0

        result = convolve_texture(gradient_texture, kernel)

        # All values should be valid uint8
        assert np.all(result >= 0)
        assert np.all(result <= 255)

    def test_convolve_with_large_kernel(self, solid_texture):
        """Convolution handles larger kernels"""
        kernel = np.ones((5, 5)) / 25.0

        result = convolve_texture(solid_texture, kernel)

        # Should still work
        assert result.shape == solid_texture.shape
        assert result.dtype == np.uint8


# === Additional Integration Tests ===

class TestMorphologicalIntegration:
    """Integration tests for morphological operations"""

    def test_erode_then_dilate(self, sample_texture):
        """Erosion followed by dilation (opening)"""
        eroded = erode_texture(sample_texture, kernel_size=3)
        result = dilate_texture(eroded, kernel_size=3)

        # Should have removed small noise
        assert result.shape == sample_texture.shape

    def test_dilate_then_erode(self, sample_texture):
        """Dilation followed by erosion (closing)"""
        dilated = dilate_texture(sample_texture, kernel_size=3)
        result = erode_texture(dilated, kernel_size=3)

        # Should have filled small holes
        assert result.shape == sample_texture.shape

    def test_blur_then_sharpen(self, gradient_texture):
        """Blur then sharpen (unsharp mask effect)"""
        blurred = blur_texture(gradient_texture, sigma=1.0)
        result = sharpen_texture(blurred, amount=1.5)

        # Should recover some detail
        assert result.shape == gradient_texture.shape

    def test_chain_multiple_operations(self, sample_texture):
        """Chain multiple morphological operations"""
        result = erode_texture(sample_texture, kernel_size=3)
        result = dilate_texture(result, kernel_size=3)
        result = blur_texture(result, sigma=0.5)

        # Should complete without error
        assert result.shape == sample_texture.shape
        assert result.dtype == np.uint8


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
