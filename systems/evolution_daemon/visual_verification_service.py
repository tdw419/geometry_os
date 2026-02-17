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
