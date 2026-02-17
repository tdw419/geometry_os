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


class TestSpatialRelation:
    """Tests for SpatialRelation dataclass"""

    def test_spatial_relation_has_required_fields(self):
        from systems.evolution_daemon.visual_verification_service import SpatialRelation
        relation = SpatialRelation(
            relation_type="above",
            target_element="submit_button"
        )
        assert relation.relation_type == "above"
        assert relation.target_element == "submit_button"

    def test_spatial_relation_has_default_tolerance(self):
        from systems.evolution_daemon.visual_verification_service import SpatialRelation
        relation = SpatialRelation(
            relation_type="left_of",
            target_element="input_field"
        )
        assert relation.tolerance == 10


class TestVerificationMatch:
    """Tests for VerificationMatch dataclass"""

    def test_verification_match_has_required_fields(self):
        from systems.evolution_daemon.visual_verification_service import (
            VerificationMatch, CriticalityLevel
        )
        match = VerificationMatch(
            success=True,
            criticality=CriticalityLevel.TOLERANT,
            actual_position=(100, 200),
            expected_position=(100, 200),
            position_delta=(0, 0)
        )
        assert match.success is True
        assert match.position_delta == (0, 0)

    def test_verification_match_has_default_confidence(self):
        from systems.evolution_daemon.visual_verification_service import (
            VerificationMatch, CriticalityLevel
        )
        match = VerificationMatch(
            success=True,
            criticality=CriticalityLevel.EXACT,
            actual_position=(50, 50),
            expected_position=(50, 50),
            position_delta=(0, 0)
        )
        assert match.confidence == 1.0


class TestVerificationResult:
    """Tests for VerificationResult dataclass"""

    def test_verification_result_has_required_fields(self):
        from systems.evolution_daemon.visual_verification_service import VerificationResult
        result = VerificationResult(
            success=True,
            matches=[],
            overall_confidence=1.0,
            should_retry=False,
            should_escalate=False,
            retry_suggestions=[],
            summary="All verifications passed"
        )
        assert result.success is True
        assert result.should_retry is False

    def test_verification_result_retry_suggestions_default_empty(self):
        from systems.evolution_daemon.visual_verification_service import VerificationResult
        result = VerificationResult(
            success=False,
            matches=[],
            overall_confidence=0.5,
            should_retry=True,
            should_escalate=False,
            summary="Partial match"
        )
        assert result.retry_suggestions == []
