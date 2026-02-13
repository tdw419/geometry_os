# systems/pixel_compiler/tests/test_pixel_native_types.py
import pytest
from systems.pixel_compiler.pixel_native_types import (
    RuntimeConfig,
    GUIState,
    InputEvent,
    ClickEvent,
    KeyEvent,
    WidgetInfo,
    WidgetType
)


class TestRuntimeConfig:
    def test_default_config(self):
        config = RuntimeConfig()
        assert config.width == 1920
        assert config.height == 1080
        assert config.mode == "virtual"

    def test_custom_config(self):
        config = RuntimeConfig(width=2560, height=1440, mode="physical")
        assert config.width == 2560
        assert config.height == 1440
        assert config.mode == "physical"

    def test_invalid_mode_raises(self):
        with pytest.raises(ValueError):
            RuntimeConfig(mode="invalid")


class TestInputEvents:
    def test_click_event(self):
        event = ClickEvent(x=100, y=200, button=1)
        assert event.x == 100
        assert event.y == 200
        assert event.button == 1
        assert event.event_type == "click"

    def test_key_event(self):
        event = KeyEvent(key="a", modifiers=["ctrl", "shift"])
        assert event.key == "a"
        assert "ctrl" in event.modifiers
        assert event.event_type == "key"


class TestWidgetInfo:
    def test_button_widget(self):
        widget = WidgetInfo(
            widget_type=WidgetType.BUTTON,
            x=100, y=200,
            width=80, height=30,
            label="Save"
        )
        assert widget.widget_type == WidgetType.BUTTON
        assert widget.label == "Save"

    def test_widget_contains_point(self):
        widget = WidgetInfo(
            widget_type=WidgetType.BUTTON,
            x=100, y=200,
            width=80, height=30
        )
        assert widget.contains(120, 210) is True
        assert widget.contains(50, 50) is False


class TestGUIState:
    def test_empty_state(self):
        state = GUIState()
        assert len(state.widgets) == 0

    def test_add_widget(self):
        state = GUIState()
        widget = WidgetInfo(WidgetType.BUTTON, 100, 200, 80, 30)
        state.add_widget(widget)
        assert len(state.widgets) == 1

    def test_find_widget_by_type(self):
        state = GUIState()
        btn = WidgetInfo(WidgetType.BUTTON, 100, 200, 80, 30, label="Save")
        txt = WidgetInfo(WidgetType.TEXT_INPUT, 100, 300, 200, 25)
        state.add_widget(btn)
        state.add_widget(txt)

        buttons = state.find_by_type(WidgetType.BUTTON)
        assert len(buttons) == 1
        assert buttons[0].label == "Save"
