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


class TestCriticalityClassifier:
    """Tests for hybrid criticality classification"""

    def test_explicit_critical_flag_returns_exact(self):
        """Explicit critical=True should override heuristics"""
        from systems.evolution_daemon.visual_verification_service import (
            CriticalityClassifier, VisualIntent, CriticalityLevel
        )
        intent = VisualIntent(
            element_type="decoration",  # Normally non-critical
            position=(0, 0),
            size=(100, 100),
            critical=True
        )
        classifier = CriticalityClassifier()
        assert classifier.classify(intent) == CriticalityLevel.EXACT

    def test_explicit_non_critical_flag_returns_relaxed(self):
        """Explicit critical=False should override heuristics"""
        from systems.evolution_daemon.visual_verification_service import (
            CriticalityClassifier, VisualIntent, CriticalityLevel
        )
        intent = VisualIntent(
            element_type="button",  # Normally critical
            position=(0, 0),
            size=(100, 100),
            critical=False
        )
        classifier = CriticalityClassifier()
        assert classifier.classify(intent) == CriticalityLevel.RELAXED

    def test_heuristic_critical_type_returns_tolerant(self):
        """Heuristic: button should be TOLERANT"""
        from systems.evolution_daemon.visual_verification_service import (
            CriticalityClassifier, VisualIntent, CriticalityLevel
        )
        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40),
            critical=None
        )
        classifier = CriticalityClassifier()
        assert classifier.classify(intent) == CriticalityLevel.TOLERANT

    def test_heuristic_non_critical_type_returns_relaxed(self):
        """Heuristic: decoration should be RELAXED"""
        from systems.evolution_daemon.visual_verification_service import (
            CriticalityClassifier, VisualIntent, CriticalityLevel
        )
        intent = VisualIntent(
            element_type="decoration",
            position=(0, 0),
            size=(50, 50),
            critical=None
        )
        classifier = CriticalityClassifier()
        assert classifier.classify(intent) == CriticalityLevel.RELAXED


class TestLayoutVerifier:
    """Tests for layout verification with tiered strictness"""

    def test_exact_match_position_success(self):
        """Exact position match should succeed"""
        from systems.evolution_daemon.visual_verification_service import (
            LayoutVerifier, VisualIntent, CriticalityLevel
        )
        verifier = LayoutVerifier()
        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40)
        )
        actual = {"x": 100, "y": 200, "width": 80, "height": 40}

        result = verifier.verify(intent, actual, CriticalityLevel.EXACT)
        assert result.success is True
        assert result.position_delta == (0, 0)

    def test_exact_match_position_failure_one_pixel(self):
        """Even 1 pixel off should fail for EXACT"""
        from systems.evolution_daemon.visual_verification_service import (
            LayoutVerifier, VisualIntent, CriticalityLevel
        )
        verifier = LayoutVerifier()
        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40)
        )
        actual = {"x": 101, "y": 200, "width": 80, "height": 40}

        result = verifier.verify(intent, actual, CriticalityLevel.EXACT)
        assert result.success is False
        assert result.position_delta == (1, 0)

    def test_tolerant_match_success_within_tolerance(self):
        """Within tolerance (±5) should succeed for TOLERANT"""
        from systems.evolution_daemon.visual_verification_service import (
            LayoutVerifier, VisualIntent, CriticalityLevel
        )
        verifier = LayoutVerifier()
        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40)
        )
        actual = {"x": 103, "y": 198, "width": 80, "height": 40}

        result = verifier.verify(intent, actual, CriticalityLevel.TOLERANT)
        assert result.success is True

    def test_tolerant_match_failure_beyond_tolerance(self):
        """Beyond tolerance should fail for TOLERANT"""
        from systems.evolution_daemon.visual_verification_service import (
            LayoutVerifier, VisualIntent, CriticalityLevel
        )
        verifier = LayoutVerifier()
        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40)
        )
        actual = {"x": 110, "y": 200, "width": 80, "height": 40}

        result = verifier.verify(intent, actual, CriticalityLevel.TOLERANT)
        assert result.success is False
        assert result.position_delta == (10, 0)


class TestTextVerifier:
    """Tests for text content verification"""

    def test_text_exact_match_success(self):
        """Exact text match should succeed"""
        from systems.evolution_daemon.visual_verification_service import (
            TextVerifier, VisualIntent, CriticalityLevel
        )
        verifier = TextVerifier()
        intent = VisualIntent(
            element_type="text",
            position=(50, 50),
            size=(100, 20),
            properties={"text": "Save"}
        )
        actual = {"x": 50, "y": 50, "text": "Save"}

        result = verifier.verify(intent, actual, CriticalityLevel.EXACT)
        assert result.success is True

    def test_text_exact_match_failure(self):
        """Text mismatch should fail for EXACT"""
        from systems.evolution_daemon.visual_verification_service import (
            TextVerifier, VisualIntent, CriticalityLevel
        )
        verifier = TextVerifier()
        intent = VisualIntent(
            element_type="text",
            position=(50, 50),
            size=(100, 20),
            properties={"text": "Save"}
        )
        actual = {"x": 50, "y": 50, "text": "Save "}

        result = verifier.verify(intent, actual, CriticalityLevel.EXACT)
        assert result.success is False

    def test_text_tolerant_similar_match(self):
        """Similar text should succeed for TOLERANT"""
        from systems.evolution_daemon.visual_verification_service import (
            TextVerifier, VisualIntent, CriticalityLevel
        )
        verifier = TextVerifier()
        intent = VisualIntent(
            element_type="text",
            position=(50, 50),
            size=(100, 20),
            properties={"text": "Save"}
        )
        actual = {"x": 50, "y": 50, "text": "save"}  # Case difference

        result = verifier.verify(intent, actual, CriticalityLevel.TOLERANT)
        assert result.success is True

    def test_text_missing_in_actual(self):
        """Missing text should fail"""
        from systems.evolution_daemon.visual_verification_service import (
            TextVerifier, VisualIntent, CriticalityLevel
        )
        verifier = TextVerifier()
        intent = VisualIntent(
            element_type="text",
            position=(50, 50),
            size=(100, 20),
            properties={"text": "Save"}
        )
        actual = {"x": 50, "y": 50}

        result = verifier.verify(intent, actual, CriticalityLevel.EXACT)
        assert result.success is False


class TestSpatialVerifier:
    """Tests for spatial relationship verification"""

    def test_spatial_above_success(self):
        """Element above target should pass"""
        from systems.evolution_daemon.visual_verification_service import (
            SpatialVerifier, VisualIntent, SpatialRelation
        )
        verifier = SpatialVerifier()
        intent = VisualIntent(
            element_type="label",
            position=(100, 100),
            size=(80, 20),
            spatial_relations=[
                SpatialRelation(relation_type="above", target_element="button")
            ]
        )
        scene = {
            "children": [
                {"type": "label", "x": 100, "y": 100, "width": 80, "height": 20},
                {"type": "button", "x": 100, "y": 150, "width": 80, "height": 40}
            ]
        }

        result = verifier.verify(intent, scene)
        assert result.success is True

    def test_spatial_left_of_success(self):
        """Element left of target should pass"""
        from systems.evolution_daemon.visual_verification_service import (
            SpatialVerifier, VisualIntent, SpatialRelation
        )
        verifier = SpatialVerifier()
        intent = VisualIntent(
            element_type="label",
            position=(50, 100),
            size=(40, 20),
            spatial_relations=[
                SpatialRelation(relation_type="left_of", target_element="input")
            ]
        )
        scene = {
            "children": [
                {"type": "label", "x": 50, "y": 100, "width": 40, "height": 20},
                {"type": "input", "x": 100, "y": 100, "width": 200, "height": 30}
            ]
        }

        result = verifier.verify(intent, scene)
        assert result.success is True

    def test_spatial_inside_success(self):
        """Element inside target should pass"""
        from systems.evolution_daemon.visual_verification_service import (
            SpatialVerifier, VisualIntent, SpatialRelation
        )
        verifier = SpatialVerifier()
        intent = VisualIntent(
            element_type="button",
            position=(110, 60),
            size=(80, 30),
            spatial_relations=[
                SpatialRelation(relation_type="inside", target_element="window")
            ]
        )
        scene = {
            "children": [
                {"type": "Window", "x": 100, "y": 50, "width": 200, "height": 150},
                {"type": "button", "x": 110, "y": 60, "width": 80, "height": 30}
            ]
        }

        result = verifier.verify(intent, scene)
        assert result.success is True

    def test_spatial_relation_not_found_target(self):
        """Missing target element should fail"""
        from systems.evolution_daemon.visual_verification_service import (
            SpatialVerifier, VisualIntent, SpatialRelation
        )
        verifier = SpatialVerifier()
        intent = VisualIntent(
            element_type="label",
            position=(50, 100),
            size=(40, 20),
            spatial_relations=[
                SpatialRelation(relation_type="above", target_element="nonexistent")
            ]
        )
        scene = {
            "children": [
                {"type": "label", "x": 50, "y": 100, "width": 40, "height": 20}
            ]
        }

        result = verifier.verify(intent, scene)
        assert result.success is False


class TestVisualVerificationService:
    """Tests for main verification service"""

    @pytest.mark.asyncio
    async def test_verify_success(self):
        """Complete verification flow with success"""
        from systems.evolution_daemon.visual_verification_service import (
            VisualVerificationService, VisualIntent
        )
        service = VisualVerificationService()
        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40),
            critical=True
        )
        scene = {
            "children": [
                {"type": "Button", "x": 100, "y": 200, "width": 80, "height": 40}
            ]
        }

        result = await service.verify(intent, scene, attempt_number=1)

        assert result.success is True
        assert result.should_retry is False
        assert result.should_escalate is False

    @pytest.mark.asyncio
    async def test_verify_element_not_found(self):
        """Element not found should return failure"""
        from systems.evolution_daemon.visual_verification_service import (
            VisualVerificationService, VisualIntent
        )
        service = VisualVerificationService()
        intent = VisualIntent(
            element_type="button",
            position=(500, 500),
            size=(80, 40)
        )
        scene = {
            "children": [
                {"type": "Button", "x": 100, "y": 200, "width": 80, "height": 40}
            ]
        }

        result = await service.verify(intent, scene, attempt_number=1)

        assert result.success is False
        assert "not found" in result.summary.lower()

    @pytest.mark.asyncio
    async def test_verify_with_retry_suggestions(self):
        """Failed verification should provide suggestions"""
        from systems.evolution_daemon.visual_verification_service import (
            VisualVerificationService, VisualIntent
        )
        service = VisualVerificationService()
        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40)
        )
        scene = {
            "children": [
                {"type": "Button", "x": 115, "y": 200, "width": 80, "height": 40}  # 15px off
            ]
        }

        result = await service.verify(intent, scene, attempt_number=1)

        assert result.success is False
        assert result.should_retry is True
        assert len(result.retry_suggestions) >= 1
