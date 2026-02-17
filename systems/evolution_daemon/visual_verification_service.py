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
