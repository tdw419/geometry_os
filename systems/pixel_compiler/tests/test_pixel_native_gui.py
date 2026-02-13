# systems/pixel_compiler/tests/test_pixel_native_gui.py
import pytest
import numpy as np
from systems.pixel_compiler.pixel_native_gui import PixelNativeGUI
from systems.pixel_compiler.pixel_native_types import RuntimeConfig


class TestPixelNativeGUI:
    def test_create_gui(self):
        gui = PixelNativeGUI(width=800, height=600)
        assert gui.width == 800
        assert gui.height == 600

    def test_perceive_returns_state(self):
        gui = PixelNativeGUI(width=200, height=200)
        state = gui.perceive()
        assert state is not None
        assert hasattr(state, 'widgets')

    def test_find_widget(self):
        gui = PixelNativeGUI(width=200, height=200)

        # Draw a button directly on framebuffer
        gui._framebuffer.fill_rect(50, 50, 80, 30, (200, 100, 100, 255))

        coords = gui.find_widget("button")
        assert coords is not None
        x, y = coords
        assert 50 <= x <= 130

    def test_click_injects_input(self):
        gui = PixelNativeGUI(width=200, height=200)
        gui.click(100, 100)

        assert len(gui._runtime.pending_inputs) > 0

    def test_type_text_injects_inputs(self):
        gui = PixelNativeGUI(width=200, height=200)
        gui.type_text("hello")

        # Should have 10 events (5 chars * 2 events each)
        assert len(gui._injector.get_pending_events()) == 10

    def test_execute_frame_processes_inputs(self):
        gui = PixelNativeGUI(width=200, height=200)
        gui.click(50, 50)

        gui.execute_frame()

        assert len(gui._runtime.pending_inputs) == 0

    def test_wait_for_change(self):
        gui = PixelNativeGUI(width=200, height=200)

        # Capture before
        gui._feedback.capture_before()

        # Make change
        gui._framebuffer.fill_rect(10, 10, 20, 20, (255, 0, 0, 255))

        # Should detect change
        changed = gui.wait_for_change(timeout_ms=100)
        assert changed is True

    def test_get_pixels(self):
        gui = PixelNativeGUI(width=100, height=100)
        pixels = gui.get_pixels()

        assert pixels.shape == (100, 100, 4)
        assert pixels.dtype == np.uint8

    def test_action_loop(self):
        """Test full action loop: perceive -> act -> verify."""
        gui = PixelNativeGUI(width=200, height=200)

        # Draw a button
        gui._framebuffer.fill_rect(50, 50, 80, 30, (200, 100, 100, 255))

        # Find it
        coords = gui.find_widget("button")
        assert coords is not None

        # Click it
        x, y = coords
        gui.click(x, y)

        # Verify something happened
        gui.execute_frame()


def test_import_from_package():
    from systems.pixel_compiler import PixelNativeGUI
    from systems.pixel_compiler import RuntimeConfig
    from systems.pixel_compiler import VirtualFramebuffer

    gui = PixelNativeGUI(width=100, height=100)
    assert gui is not None


class TestPixelNativeGUIGPU:
    def test_gui_with_gpu_context(self):
        """Test GUI with GPU context enabled."""
        from systems.pixel_compiler.pixel_native_gui import PixelNativeGUI

        gui = PixelNativeGUI(width=100, height=100, use_gpu=True)

        # Should have GPU context
        assert gui._runtime._gpu_ctx is not None

    def test_gui_forces_mock_mode(self):
        """Test GUI can force mock mode."""
        from systems.pixel_compiler.pixel_native_gui import PixelNativeGUI

        gui = PixelNativeGUI(width=100, height=100, use_gpu=False)

        assert gui._runtime.using_gpu is False

    def test_gpu_performance_target(self):
        """Test that GPU mode meets performance targets."""
        from systems.pixel_compiler.pixel_native_gui import PixelNativeGUI
        import time

        gui = PixelNativeGUI(width=200, height=200, use_gpu=True)

        # Draw something
        gui._framebuffer.fill_rect(50, 50, 100, 100, (255, 0, 0, 255))

        # Measure perception time
        start = time.time()
        state = gui.perceive()
        elapsed_ms = (time.time() - start) * 1000

        # Target: < 100ms for perception (generous for mock mode)
        assert elapsed_ms < 100, f"Perception took {elapsed_ms}ms"

    def test_end_to_end_gpu_action(self):
        """Test full action loop with GPU."""
        from systems.pixel_compiler.pixel_native_gui import PixelNativeGUI

        gui = PixelNativeGUI(width=200, height=200, use_gpu=True)

        # Draw a button
        gui._framebuffer.fill_rect(50, 50, 80, 30, (200, 100, 100, 255))

        # Perceive
        state = gui.perceive()
        assert len(state.widgets) > 0

        # Find widget
        coords = gui.find_widget("button")
        assert coords is not None

        # Click
        x, y = coords
        gui.click(x, y)

        # Execute
        gui.execute_frame()

        # Verify
        assert gui._runtime.frame_count > 0
