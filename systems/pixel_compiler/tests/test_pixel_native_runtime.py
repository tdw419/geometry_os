# systems/pixel_compiler/tests/test_pixel_native_runtime.py
import pytest
import numpy as np
from systems.pixel_compiler.pixel_native_runtime import PixelNativeRuntime
from systems.pixel_compiler.pixel_native_types import RuntimeConfig, ClickEvent


class TestPixelNativeRuntime:
    def test_create_runtime_default_config(self):
        runtime = PixelNativeRuntime()
        assert runtime.config.width == 1920
        assert runtime.config.height == 1080
        assert runtime.config.mode == "virtual"

    def test_create_runtime_custom_config(self):
        config = RuntimeConfig(width=800, height=600, mode="virtual")
        runtime = PixelNativeRuntime(config)
        assert runtime.config.width == 800
        assert runtime.config.height == 600

    def test_get_framebuffer_returns_array(self):
        runtime = PixelNativeRuntime(RuntimeConfig(width=100, height=100))
        fb = runtime.get_framebuffer()
        assert fb.shape == (100, 100, 4)

    def test_get_framebuffer_is_zero_copy(self):
        runtime = PixelNativeRuntime(RuntimeConfig(width=100, height=100))
        fb1 = runtime.get_framebuffer()
        fb2 = runtime.get_framebuffer()
        # In mock mode, these should be views of same data
        fb1[0, 0] = 255
        # np.array_equal compares arrays element-wise
        assert np.array_equal(fb2[0, 0], np.array([255, 255, 255, 255]))

    def test_execute_frame_advances_frame_counter(self):
        runtime = PixelNativeRuntime(RuntimeConfig(width=100, height=100))
        initial_frame = runtime.frame_count
        runtime.execute_frame()
        assert runtime.frame_count == initial_frame + 1

    def test_inject_input_accepts_click(self):
        runtime = PixelNativeRuntime(RuntimeConfig(width=100, height=100))
        event = ClickEvent(x=50, y=50, button=1)
        runtime.inject_input(event)
        assert len(runtime.pending_inputs) == 1

    def test_process_inputs_clears_queue(self):
        runtime = PixelNativeRuntime(RuntimeConfig(width=100, height=100))
        runtime.inject_input(ClickEvent(x=50, y=50))
        runtime.process_inputs()
        assert len(runtime.pending_inputs) == 0


class TestPixelNativeRuntimeGPU:
    def test_runtime_creates_gpu_context(self):
        """Test that runtime creates GPU context."""
        from systems.pixel_compiler.pixel_native_runtime import PixelNativeRuntime
        from systems.pixel_compiler.pixel_native_types import RuntimeConfig

        config = RuntimeConfig(width=100, height=100)
        runtime = PixelNativeRuntime(config, use_gpu=True)

        assert runtime._gpu_ctx is not None
        assert runtime.using_gpu is not None  # True or False

    def test_runtime_falls_back_to_mock(self):
        """Test that runtime can force mock mode."""
        from systems.pixel_compiler.pixel_native_runtime import PixelNativeRuntime
        from systems.pixel_compiler.pixel_native_types import RuntimeConfig

        config = RuntimeConfig(width=100, height=100)
        runtime = PixelNativeRuntime(config, use_gpu=False)

        assert runtime.using_gpu is False
        assert runtime._gpu_ctx.mock is True

    def test_gpu_framebuffer_is_fast(self):
        """Test that GPU framebuffer access is efficient."""
        from systems.pixel_compiler.pixel_native_runtime import PixelNativeRuntime
        from systems.pixel_compiler.pixel_native_types import RuntimeConfig
        import time

        config = RuntimeConfig(width=100, height=100)
        runtime = PixelNativeRuntime(config, use_gpu=True)
        runtime.initialize()

        # Multiple reads should be fast
        start = time.time()
        for _ in range(10):
            fb = runtime.get_framebuffer()
        elapsed = time.time() - start

        # Should complete in reasonable time (< 1 second for 10 reads)
        assert elapsed < 1.0

    def test_execute_frame_with_gpu(self):
        """Test frame execution with GPU context."""
        from systems.pixel_compiler.pixel_native_runtime import PixelNativeRuntime
        from systems.pixel_compiler.pixel_native_types import RuntimeConfig, ClickEvent

        config = RuntimeConfig(width=100, height=100)
        runtime = PixelNativeRuntime(config, use_gpu=True)
        runtime.initialize()

        # Inject input
        runtime.inject_input(ClickEvent(x=50, y=50))

        # Execute frame
        runtime.execute_frame()

        assert runtime.frame_count == 1
        assert len(runtime.pending_inputs) == 0
