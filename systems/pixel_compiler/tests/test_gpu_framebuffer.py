# systems/pixel_compiler/tests/test_gpu_framebuffer.py
import pytest
import numpy as np


class TestGPUFramebuffer:
    def test_create_framebuffer(self):
        """Test GPU framebuffer creation."""
        from systems.pixel_compiler.gpu_framebuffer import GPUFramebuffer
        from systems.pixel_compiler.gpu_context import GPUContext

        ctx = GPUContext()
        fb = GPUFramebuffer(ctx, 800, 600)

        assert fb.width == 800
        assert fb.height == 600

    def test_write_and_read_pixels(self):
        """Test writing and reading pixels."""
        from systems.pixel_compiler.gpu_framebuffer import GPUFramebuffer
        from systems.pixel_compiler.gpu_context import GPUContext

        ctx = GPUContext()
        fb = GPUFramebuffer(ctx, 100, 100)

        # Create test data
        test_data = np.full((100, 100, 4), 255, dtype=np.uint8)
        test_data[0, 0] = [255, 0, 0, 255]  # Red pixel

        # Write to framebuffer
        fb.write(test_data)

        # Read back
        result = fb.read()

        assert result.shape == (100, 100, 4)
        assert tuple(result[0, 0]) == (255, 0, 0, 255)

    def test_clear_framebuffer(self):
        """Test clearing framebuffer."""
        from systems.pixel_compiler.gpu_framebuffer import GPUFramebuffer
        from systems.pixel_compiler.gpu_context import GPUContext

        ctx = GPUContext()
        fb = GPUFramebuffer(ctx, 50, 50)

        # Write some data
        fb.write(np.full((50, 50, 4), 128, dtype=np.uint8))

        # Clear
        fb.clear()

        # Verify cleared to black
        result = fb.read()
        assert np.all(result == 0)

    def test_get_region(self):
        """Test getting a region of the framebuffer."""
        from systems.pixel_compiler.gpu_framebuffer import GPUFramebuffer
        from systems.pixel_compiler.gpu_context import GPUContext

        ctx = GPUContext()
        fb = GPUFramebuffer(ctx, 100, 100)

        # Create pattern: top-left quadrant red, rest black
        data = np.zeros((100, 100, 4), dtype=np.uint8)
        data[0:50, 0:50] = [255, 0, 0, 255]
        fb.write(data)

        # Get top-left region
        region = fb.get_region(0, 0, 50, 50)
        assert region.shape == (50, 50, 4)
        assert np.all(region[:, :, 0] == 255)  # All red

        # Get bottom-right region
        region = fb.get_region(50, 50, 50, 50)
        assert np.all(region == 0)  # All black

    def test_zero_copy_view(self):
        """Test zero-copy view access (mock only for now)."""
        from systems.pixel_compiler.gpu_framebuffer import GPUFramebuffer
        from systems.pixel_compiler.gpu_context import GPUContext

        ctx = GPUContext(force_mock=True)  # Force mock for zero-copy test
        fb = GPUFramebuffer(ctx, 100, 100)

        # In mock mode, get_pixels_view should return the underlying array
        view = fb.get_pixels_view()
        assert view.shape == (100, 100, 4)

        # Modify view should modify framebuffer
        view[0, 0] = [255, 0, 0, 255]
        result = fb.read()
        assert tuple(result[0, 0]) == (255, 0, 0, 255)
