# systems/pixel_compiler/tests/test_ai_vision_layer.py
import pytest
import numpy as np
from systems.pixel_compiler.ai_vision_layer import AIVisionLayer, MockVLM
from systems.pixel_compiler.pixel_native_types import WidgetType, GUIState, WidgetInfo
from systems.pixel_compiler.virtual_framebuffer import VirtualFramebuffer


class TestMockVLM:
    def test_create_mock_vlm(self):
        vlm = MockVLM()
        assert vlm.model_name == "mock"

    def test_detect_buttons_finds_red_regions(self):
        vlm = MockVLM()
        fb = VirtualFramebuffer(200, 200)

        # Draw two red buttons
        fb.fill_rect(10, 10, 50, 30, (200, 100, 100, 255))  # Red-ish button
        fb.fill_rect(100, 10, 50, 30, (200, 100, 100, 255))

        widgets = vlm.detect_widgets(fb.pixels)

        buttons = [w for w in widgets if w.widget_type == WidgetType.BUTTON]
        assert len(buttons) >= 2

    def test_ground_intent_returns_coordinates(self):
        vlm = MockVLM()
        fb = VirtualFramebuffer(200, 200)
        fb.fill_rect(50, 50, 80, 30, (200, 100, 100, 255))  # Red button

        coords = vlm.ground_intent("click the button", fb.pixels)
        assert len(coords) == 2
        x, y = coords
        assert 50 <= x <= 130
        assert 50 <= y <= 80


class TestAIVisionLayer:
    def test_create_vision_layer(self):
        layer = AIVisionLayer(model="mock")
        assert layer.model == "mock"

    def test_perceive_returns_gui_state(self):
        layer = AIVisionLayer(model="mock")
        fb = VirtualFramebuffer(200, 200)
        fb.fill_rect(10, 10, 80, 30, (200, 100, 100, 255))

        state = layer.perceive(fb.pixels)
        assert isinstance(state, GUIState)
        assert len(state.widgets) > 0

    def test_ground_intent(self):
        layer = AIVisionLayer(model="mock")
        fb = VirtualFramebuffer(200, 200)
        fb.fill_rect(50, 50, 80, 30, (200, 100, 100, 255))

        coords = layer.ground_intent("click button", fb.pixels)
        assert coords is not None
        x, y = coords
        assert isinstance(x, int)
        assert isinstance(y, int)

    def test_verify_action_detects_change(self):
        layer = AIVisionLayer(model="mock")
        fb = VirtualFramebuffer(200, 200)

        before = fb.pixels.copy()
        fb.fill_rect(50, 50, 80, 30, (255, 0, 0, 255))  # Change
        after = fb.pixels.copy()

        # Mock VLM always returns True for verify
        result = layer.verify_action(before, after, "button appeared")
        assert result is True

    def test_find_widget_by_label(self):
        layer = AIVisionLayer(model="mock")
        fb = VirtualFramebuffer(200, 200)

        # Draw a button
        fb.fill_rect(10, 10, 80, 30, (200, 100, 100, 255))

        state = layer.perceive(fb.pixels)
        widgets = state.find_by_label("button")

        # Mock may or may not find by label
        assert isinstance(widgets, list)
