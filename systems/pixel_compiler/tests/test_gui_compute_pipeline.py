# systems/pixel_compiler/tests/test_gui_compute_pipeline.py
import pytest
import numpy as np


class TestGUIComputePipeline:
    def test_create_pipeline(self):
        """Test compute pipeline creation."""
        from systems.pixel_compiler.gui_compute_pipeline import GUIComputePipeline
        from systems.pixel_compiler.gpu_context import GPUContext

        ctx = GPUContext()
        pipeline = GUIComputePipeline(ctx, 256, 256)

        assert pipeline is not None
        assert pipeline.width == 256
        assert pipeline.height == 256

    def test_clear_framebuffer_shader(self):
        """Test clear shader execution."""
        from systems.pixel_compiler.gui_compute_pipeline import GUIComputePipeline
        from systems.pixel_compiler.gpu_context import GPUContext

        ctx = GPUContext()
        pipeline = GUIComputePipeline(ctx, 100, 100)

        # Execute clear shader
        pipeline.clear_framebuffer(r=0.5, g=0.5, b=0.5, a=1.0)

        # Read back and verify (approximately gray)
        result = pipeline.read_framebuffer()

        # In mock mode, verify exact values
        if ctx.mock:
            assert result[0, 0, 0] > 100  # Red channel ~128
            assert result[0, 0, 1] > 100  # Green channel ~128

    def test_write_and_read_state_buffer(self):
        """Test input buffer write and read."""
        from systems.pixel_compiler.gui_compute_pipeline import GUIComputePipeline
        from systems.pixel_compiler.gpu_context import GPUContext

        ctx = GPUContext()
        pipeline = GUIComputePipeline(ctx, 100, 100)

        # Write input data
        input_data = {
            "mouse_x": 50.0,
            "mouse_y": 50.0,
            "mouse_buttons": 1,
            "frame": 1
        }
        pipeline.write_input_buffer(input_data)

        # Read back
        result = pipeline.read_input_buffer()

        assert result["mouse_x"] == 50.0
        assert result["mouse_y"] == 50.0
        assert result["mouse_buttons"] == 1

    def test_execute_frame(self):
        """Test frame execution."""
        from systems.pixel_compiler.gui_compute_pipeline import GUIComputePipeline
        from systems.pixel_compiler.gpu_context import GPUContext

        ctx = GPUContext()
        pipeline = GUIComputePipeline(ctx, 64, 64)

        # Execute a frame
        pipeline.execute_frame()

        # Frame counter should increment
        assert pipeline.frame_count == 1
