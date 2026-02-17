"""
Visual Verification Service - Journeyman Stage

Enables AI self-verification of visual modifications through tiered
verification (exact, tolerant, relaxed) with adaptive iteration and
human escalation.
"""
from enum import Enum
from dataclasses import dataclass, field
from typing import Optional, List, Dict, Any


class CriticalityLevel(Enum):
    """Verification strictness levels"""
    EXACT = "exact"           # Pixel-perfect match required
    TOLERANT = "tolerant"     # Within ±N pixels
    RELAXED = "relaxed"       # Semantic/rough match


@dataclass
class VisualIntent:
    """What the AI intended to create/modify"""
    element_type: str
    position: tuple[int, int]
    size: tuple[int, int]
    properties: Dict[str, Any] = field(default_factory=dict)
    critical: Optional[bool] = None
    spatial_relations: List['SpatialRelation'] = field(default_factory=list)


@dataclass
class SpatialRelation:
    """Expected spatial relationship between elements"""
    relation_type: str       # "above", "below", "left_of", "right_of", "inside", "overlaps"
    target_element: str
    tolerance: int = 10


@dataclass
class VerificationMatch:
    """Result of verifying a single element"""
    success: bool
    criticality: CriticalityLevel
    actual_position: tuple[int, int]
    expected_position: tuple[int, int]
    position_delta: tuple[int, int]
    failures: List[str] = field(default_factory=list)
    confidence: float = 1.0


@dataclass
class VerificationResult:
    """Complete verification result for an intent"""
    success: bool
    matches: List[VerificationMatch]
    overall_confidence: float
    should_retry: bool
    should_escalate: bool
    summary: str
    retry_suggestions: List[str] = field(default_factory=list)


class CriticalityClassifier:
    """
    Determines if an element requires exact or tolerance-based verification.
    Uses hybrid approach: explicit marking + heuristic fallback.
    """

    CRITICAL_TYPES = {
        "button", "input", "link", "checkbox", "dropdown",
        "window_title", "navigation", "form_field"
    }

    NON_CRITICAL_TYPES = {
        "decoration", "background", "icon", "divider", "spacer"
    }

    def classify(self, element: VisualIntent) -> CriticalityLevel:
        """Returns: EXACT, TOLERANT, or RELAXED"""
        # 1. Check explicit critical flag
        if element.critical is True:
            return CriticalityLevel.EXACT
        if element.critical is False:
            return CriticalityLevel.RELAXED

        # 2. Fall back to heuristic classification
        if element.element_type in self.CRITICAL_TYPES:
            return CriticalityLevel.TOLERANT
        if element.element_type in self.NON_CRITICAL_TYPES:
            return CriticalityLevel.RELAXED

        # 3. Default to tolerant
        return CriticalityLevel.TOLERANT


class LayoutVerifier:
    """
    Verifies position, size, and type of UI elements.
    Applies tiered verification based on criticality.
    """

    DEFAULT_TOLERANCE = {
        "position": 5,
        "size": 5,
    }

    def verify(
        self,
        intent: VisualIntent,
        actual: dict,
        criticality: CriticalityLevel
    ) -> VerificationMatch:
        """Verify layout matches intent based on criticality level."""
        expected_x, expected_y = intent.position
        expected_w, expected_h = intent.size

        actual_x = actual.get("x", 0)
        actual_y = actual.get("y", 0)
        actual_w = actual.get("width", 0)
        actual_h = actual.get("height", 0)

        dx = actual_x - expected_x
        dy = actual_y - expected_y
        dw = actual_w - expected_w
        dh = actual_h - expected_h

        failures = []
        tolerance = self._get_tolerance(criticality)

        if criticality == CriticalityLevel.EXACT:
            if abs(dx) > 0 or abs(dy) > 0:
                failures.append(f"Position mismatch: expected ({expected_x}, {expected_y}), got ({actual_x}, {actual_y})")
        else:
            if abs(dx) > tolerance or abs(dy) > tolerance:
                failures.append(f"Position out of tolerance: delta=({dx}, {dy}), max={tolerance}")

        if criticality == CriticalityLevel.EXACT:
            if abs(dw) > 0 or abs(dh) > 0:
                failures.append(f"Size mismatch: expected ({expected_w}, {expected_h}), got ({actual_w}, {actual_h})")
        else:
            if abs(dw) > tolerance or abs(dh) > tolerance:
                failures.append(f"Size out of tolerance: delta=({dw}, {dh}), max={tolerance}")

        success = len(failures) == 0
        confidence = 1.0 if success else max(0.0, 1.0 - (len(failures) * 0.2))

        return VerificationMatch(
            success=success,
            criticality=criticality,
            actual_position=(actual_x, actual_y),
            expected_position=(expected_x, expected_y),
            position_delta=(dx, dy),
            failures=failures,
            confidence=confidence
        )

    def _get_tolerance(self, criticality: CriticalityLevel) -> int:
        if criticality == CriticalityLevel.EXACT:
            return 0
        elif criticality == CriticalityLevel.RELAXED:
            return self.DEFAULT_TOLERANCE["position"] * 2
        return self.DEFAULT_TOLERANCE["position"]


class TextVerifier:
    """
    Verifies text content and styling.
    Supports exact match and similarity-based verification.
    """

    def verify(
        self,
        intent: VisualIntent,
        actual: dict,
        criticality: CriticalityLevel
    ) -> VerificationMatch:
        """Verify text content matches intent."""
        expected_text = intent.properties.get("text", "")
        actual_text = actual.get("text", "")

        expected_pos = intent.position
        actual_pos = (actual.get("x", 0), actual.get("y", 0))

        dx = actual_pos[0] - expected_pos[0]
        dy = actual_pos[1] - expected_pos[1]

        failures = []

        if criticality == CriticalityLevel.EXACT:
            if actual_text != expected_text:
                failures.append(f"Text mismatch: expected '{expected_text}', got '{actual_text}'")
        elif criticality == CriticalityLevel.TOLERANT:
            if actual_text.lower() != expected_text.lower():
                similarity = self._calculate_similarity(expected_text, actual_text)
                if similarity < 0.8:
                    failures.append(f"Text too different: {similarity:.0%} similar")
        elif not actual_text:
            failures.append("No text found")

        success = len(failures) == 0
        confidence = 1.0 if success else 0.5

        return VerificationMatch(
            success=success,
            criticality=criticality,
            actual_position=actual_pos,
            expected_position=expected_pos,
            position_delta=(dx, dy),
            failures=failures,
            confidence=confidence
        )

    def _calculate_similarity(self, text1: str, text2: str) -> float:
        """Calculate simple text similarity (Jaccard on words)."""
        if not text1 and not text2:
            return 1.0
        if not text1 or not text2:
            return 0.0

        words1 = set(text1.lower().split())
        words2 = set(text2.lower().split())

        if not words1 and not words2:
            return 1.0

        intersection = words1 & words2
        union = words1 | words2

        return len(intersection) / len(union) if union else 0.0


class SpatialVerifier:
    """
    Verifies relative positions and spatial relationships.
    Checks: above/below, left/right, overlaps, contains, etc.
    """

    def verify(
        self,
        intent: VisualIntent,
        scene: dict
    ) -> VerificationMatch:
        """Verify spatial relationships in the scene."""
        failures = []

        # Find the subject element in the scene
        subject = self._find_element_by_position(scene, intent.position)
        if not subject:
            return VerificationMatch(
                success=False,
                criticality=CriticalityLevel.TOLERANT,
                actual_position=(0, 0),
                expected_position=intent.position,
                position_delta=(0, 0),
                failures=["Subject element not found in scene"],
                confidence=0.0
            )

        subject_bounds = self._get_bounds(subject)

        # Check each spatial relation
        for relation in intent.spatial_relations:
            target = self._find_element_by_type(scene, relation.target_element)
            if not target:
                failures.append(f"Target element '{relation.target_element}' not found")
                continue

            target_bounds = self._get_bounds(target)

            if not self._check_relation(
                subject_bounds, target_bounds,
                relation.relation_type, relation.tolerance
            ):
                failures.append(
                    f"Spatial relation '{relation.relation_type}' to '{relation.target_element}' not satisfied"
                )

        success = len(failures) == 0
        confidence = 1.0 if success else max(0.0, 1.0 - len(failures) * 0.25)

        return VerificationMatch(
            success=success,
            criticality=CriticalityLevel.TOLERANT,
            actual_position=(subject_bounds["x"], subject_bounds["y"]),
            expected_position=intent.position,
            position_delta=(
                subject_bounds["x"] - intent.position[0],
                subject_bounds["y"] - intent.position[1]
            ),
            failures=failures,
            confidence=confidence
        )

    def _find_element_by_position(self, scene: dict, position: tuple) -> dict | None:
        """Find element at or near the given position."""
        for child in scene.get("children", []):
            x, y = child.get("x", 0), child.get("y", 0)
            if abs(x - position[0]) < 10 and abs(y - position[1]) < 10:
                return child
        return None

    def _find_element_by_type(self, scene: dict, target_type: str) -> dict | None:
        """Find element by type or description."""
        target_lower = target_type.lower()
        for child in scene.get("children", []):
            child_type = child.get("type", "").lower()
            if target_lower in child_type or child_type in target_lower:
                return child
        return None

    def _get_bounds(self, element: dict) -> dict:
        """Get bounding box of element."""
        return {
            "x": element.get("x", 0),
            "y": element.get("y", 0),
            "width": element.get("width", 0),
            "height": element.get("height", 0)
        }

    def _check_relation(
        self,
        subject: dict,
        target: dict,
        relation_type: str,
        tolerance: int
    ) -> bool:
        """Check if spatial relation is satisfied."""
        if relation_type == "above":
            return subject["y"] + subject["height"] <= target["y"] + tolerance
        elif relation_type == "below":
            return subject["y"] >= target["y"] + target["height"] - tolerance
        elif relation_type == "left_of":
            return subject["x"] + subject["width"] <= target["x"] + tolerance
        elif relation_type == "right_of":
            return subject["x"] >= target["x"] + target["width"] - tolerance
        elif relation_type == "inside":
            return (
                subject["x"] >= target["x"] - tolerance and
                subject["y"] >= target["y"] - tolerance and
                subject["x"] + subject["width"] <= target["x"] + target["width"] + tolerance and
                subject["y"] + subject["height"] <= target["y"] + target["height"] + tolerance
            )
        elif relation_type == "overlaps":
            return (
                subject["x"] < target["x"] + target["width"] and
                subject["x"] + subject["width"] > target["x"] and
                subject["y"] < target["y"] + target["height"] and
                subject["y"] + subject["height"] > target["y"]
            )
        return True  # Unknown relation, pass by default


class VisualVerificationService:
    """
    Main service for visual self-verification.
    Implements the Journeyman Stage closed-loop verification.
    """

    # Configuration
    MAX_RETRIES = 5
    CONFIDENCE_THRESHOLD = 0.6    # Below this, escalate to human
    MIN_CONFIDENCE_FOR_RETRY = 0.3  # Below this, don't even retry

    def __init__(self):
        self.classifier = CriticalityClassifier()
        self.layout_verifier = LayoutVerifier()
        self.text_verifier = TextVerifier()
        self.spatial_verifier = SpatialVerifier()

    async def verify(
        self,
        intent: VisualIntent,
        actual_scene: dict,
        attempt_number: int = 1
    ) -> VerificationResult:
        """
        Main entry point: Verify that actual scene matches intent.

        Args:
            intent: What the AI intended to create
            actual_scene: Current visual state from mirror neuron
            attempt_number: Current retry attempt (for adaptive learning)

        Returns:
            VerificationResult with success, confidence, and next action
        """
        matches = []

        # 1. Find the target element in the scene
        actual_element = self._find_element(intent, actual_scene)

        if actual_element is None:
            return self._create_not_found_result(intent, attempt_number)

        # 2. Classify criticality (hybrid: explicit + heuristic)
        criticality = self.classifier.classify(intent)

        # 3. Run verifiers based on intent type
        match = self.layout_verifier.verify(intent, actual_element, criticality)
        matches.append(match)

        if intent.properties.get("text"):
            match = self.text_verifier.verify(intent, actual_element, criticality)
            matches.append(match)

        if intent.spatial_relations:
            match = self.spatial_verifier.verify(intent, actual_scene)
            matches.append(match)

        # 4. Calculate overall confidence
        total_confidence = self._calculate_confidence(matches, attempt_number)

        # 5. Determine next action
        all_success = all(m.success for m in matches)
        should_retry = self._should_retry(all_success, total_confidence, attempt_number)
        should_escalate = self._should_escalate(total_confidence, attempt_number)

        # 6. Generate retry suggestions if needed
        retry_suggestions = []
        if not all_success and should_retry:
            retry_suggestions = self._generate_suggestions(matches, intent)

        return VerificationResult(
            success=all_success,
            matches=matches,
            overall_confidence=total_confidence,
            should_retry=should_retry,
            should_escalate=should_escalate,
            retry_suggestions=retry_suggestions,
            summary=self._generate_summary(matches, all_success)
        )

    def _find_element(self, intent: VisualIntent, scene: dict) -> dict | None:
        """Find the element matching the intent in the scene."""
        target_x, target_y = intent.position

        for child in scene.get("children", []):
            x, y = child.get("x", 0), child.get("y", 0)
            # Allow some tolerance in finding
            if abs(x - target_x) < 50 and abs(y - target_y) < 50:
                return child
        return None

    def _create_not_found_result(
        self,
        intent: VisualIntent,
        attempt_number: int
    ) -> VerificationResult:
        """Create a result for when the element is not found."""
        confidence = max(0.0, 0.2 - (attempt_number - 1) * 0.05)
        return VerificationResult(
            success=False,
            matches=[],
            overall_confidence=confidence,
            should_retry=attempt_number < self.MAX_RETRIES,
            should_escalate=attempt_number >= 2,
            retry_suggestions=[f"Element not found at {intent.position}. Try placing it first."],
            summary=f"Element '{intent.element_type}' not found at position {intent.position}"
        )

    def _should_retry(self, success: bool, confidence: float, attempt: int) -> bool:
        """Adaptive iteration logic"""
        if success:
            return False
        if attempt >= self.MAX_RETRIES:
            return False
        if confidence < self.MIN_CONFIDENCE_FOR_RETRY:
            return False
        return True

    def _should_escalate(self, confidence: float, attempt: int) -> bool:
        """Human escalation logic"""
        if confidence < self.CONFIDENCE_THRESHOLD and attempt >= 2:
            return True
        if attempt >= self.MAX_RETRIES:
            return True
        return False

    def _calculate_confidence(
        self,
        matches: list[VerificationMatch],
        attempt: int
    ) -> float:
        """Calculate overall confidence score with attempt penalty."""
        if not matches:
            return 0.0

        match_scores = [m.confidence for m in matches]
        base_confidence = sum(match_scores) / len(match_scores)

        # Penalty for multiple attempts
        attempt_penalty = max(0, 0.1 * (attempt - 1))

        return max(0.0, base_confidence - attempt_penalty)

    def _generate_suggestions(
        self,
        matches: list[VerificationMatch],
        intent: VisualIntent
    ) -> list[str]:
        """Generate actionable hints for the next retry attempt."""
        suggestions = []

        for match in matches:
            if not match.success:
                dx, dy = match.position_delta

                if abs(dx) > 0 or abs(dy) > 0:
                    suggestions.append(
                        f"Adjust position by ({-dx}, {-dy}) to correct placement"
                    )

                for failure in match.failures:
                    suggestions.append(f"Fix: {failure}")

        return suggestions

    def _generate_summary(
        self,
        matches: list[VerificationMatch],
        success: bool
    ) -> str:
        """Generate human-readable summary."""
        if success:
            return "All verifications passed"

        failures = []
        for match in matches:
            failures.extend(match.failures)

        if len(failures) == 1:
            return f"Verification failed: {failures[0]}"

        return f"Verification failed with {len(failures)} issues"
