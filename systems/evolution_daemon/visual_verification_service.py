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
