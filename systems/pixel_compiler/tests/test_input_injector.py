# systems/pixel_compiler/tests/test_input_injector.py
import pytest
from systems.pixel_compiler.input_injector import InputInjector
from systems.pixel_compiler.pixel_native_types import ClickEvent, KeyEvent, DragEvent


class TestInputInjector:
    def test_create_gpu_mode(self):
        injector = InputInjector(mode="gpu")
        assert injector.mode == "gpu"

    def test_create_wayland_mode(self):
        injector = InputInjector(mode="wayland")
        assert injector.mode == "wayland"

    def test_click_creates_event(self):
        injector = InputInjector(mode="gpu")
        injector.click(100, 200, button=1)

        events = injector.get_pending_events()
        assert len(events) == 2  # press + release

        assert events[0].x == 100
        assert events[0].y == 200
        assert events[0].button == 1
        assert events[0].pressed is True

    def test_type_text_creates_events(self):
        injector = InputInjector(mode="gpu")
        injector.type_text("ab")

        events = injector.get_pending_events()
        assert len(events) == 4  # a press, a release, b press, b release

    def test_key_press_with_modifiers(self):
        injector = InputInjector(mode="gpu")
        injector.key_press("c", modifiers=["ctrl"])

        events = injector.get_pending_events()
        # Should have ctrl press, c press, c release, ctrl release
        assert len(events) == 4

    def test_drag_creates_move_events(self):
        injector = InputInjector(mode="gpu")
        injector.drag(0, 0, 100, 100, steps=10)

        events = injector.get_pending_events()
        # Should have press at start, moves, release at end
        assert events[0].event_type == "click"
        assert events[0].pressed is True
        assert events[-1].event_type == "click"
        assert events[-1].pressed is False

    def test_clear_events(self):
        injector = InputInjector(mode="gpu")
        injector.click(50, 50)
        assert len(injector.get_pending_events()) > 0

        injector.clear_events()
        assert len(injector.get_pending_events()) == 0

    def test_coordinate_clamping(self):
        injector = InputInjector(mode="gpu", bounds=(800, 600))
        injector.click(1000, 700)  # Out of bounds

        events = injector.get_pending_events()
        # Should be clamped to bounds
        assert events[0].x == 800
        assert events[0].y == 600
