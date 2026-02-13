# systems/pixel_compiler/tests/test_gpu_context.py
import pytest
import numpy as np


class TestGPUContext:
    def test_create_context_auto_detect(self):
        """Test that context can be created with auto-detection."""
        from systems.pixel_compiler.gpu_context import GPUContext

        ctx = GPUContext()
        # Should succeed - either real GPU or mock
        assert ctx is not None
        assert ctx.is_available is not None  # True or False

    def test_context_has_device_or_mock(self):
        """Test that context has device (real) or mock_device (fallback)."""
        from systems.pixel_compiler.gpu_context import GPUContext

        ctx = GPUContext()
        if ctx.is_available:
            assert ctx.device is not None
        else:
            assert ctx.mock is True

    def test_context_shutdown(self):
        """Test that context can be shut down cleanly."""
        from systems.pixel_compiler.gpu_context import GPUContext

        ctx = GPUContext()
        ctx.shutdown()
        assert ctx._shutdown is True

    def test_create_buffer(self):
        """Test buffer creation."""
        from systems.pixel_compiler.gpu_context import GPUContext

        ctx = GPUContext()
        buffer = ctx.create_buffer(1024, label="test_buffer")
        assert buffer is not None
        assert buffer.size == 1024

    def test_create_texture(self):
        """Test texture creation."""
        from systems.pixel_compiler.gpu_context import GPUContext

        ctx = GPUContext()
        texture = ctx.create_texture(256, 256, label="test_texture")
        assert texture is not None
        assert texture.width == 256
        assert texture.height == 256
