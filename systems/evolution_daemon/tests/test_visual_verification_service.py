"""
Journeyman Stage - Visual Verification Service Tests

Tests for AI self-verification of visual modifications.
"""
import pytest


class TestCriticalityLevel:
    """Tests for CriticalityLevel enum"""

    def test_criticality_level_has_exact(self):
        from systems.evolution_daemon.visual_verification_service import CriticalityLevel
        assert CriticalityLevel.EXACT.value == "exact"

    def test_criticality_level_has_tolerant(self):
        from systems.evolution_daemon.visual_verification_service import CriticalityLevel
        assert CriticalityLevel.TOLERANT.value == "tolerant"

    def test_criticality_level_has_relaxed(self):
        from systems.evolution_daemon.visual_verification_service import CriticalityLevel
        assert CriticalityLevel.RELAXED.value == "relaxed"


class TestVisualIntent:
    """Tests for VisualIntent dataclass"""

    def test_visual_intent_has_required_fields(self):
        from systems.evolution_daemon.visual_verification_service import VisualIntent
        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40)
        )
        assert intent.element_type == "button"
        assert intent.position == (100, 200)
        assert intent.size == (80, 40)

    def test_visual_intent_has_optional_critical_flag(self):
        from systems.evolution_daemon.visual_verification_service import VisualIntent
        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40),
            critical=True
        )
        assert intent.critical is True

    def test_visual_intent_critical_defaults_to_none(self):
        from systems.evolution_daemon.visual_verification_service import VisualIntent
        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40)
        )
        assert intent.critical is None

    def test_visual_intent_has_properties_dict(self):
        from systems.evolution_daemon.visual_verification_service import VisualIntent
        intent = VisualIntent(
            element_type="text",
            position=(50, 50),
            size=(100, 20),
            properties={"text": "Save", "font_size": 14}
        )
        assert intent.properties["text"] == "Save"
