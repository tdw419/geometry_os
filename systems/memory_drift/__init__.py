"""
Memory Drift System - Gravitational Memory for Geometry OS

KV-Cache entries physically drift toward related code tiles on the Infinite Map.
Semantic similarity becomes a physical force that pulls memory closer to code.

Formula:
    position_new = position_old + alpha * e^(-beta * t) * (code_position - position_old)

Where:
    alpha = drift_rate (0.1)
    beta = decay_rate (0.5)
    t = time_since_last_access
"""

from systems.memory_drift.drift_engine import DriftEngine, MemoryEntry
from systems.memory_drift.drift_visualizer import DriftVisualizer
from systems.memory_drift.semantic_anchor import CodeAnchor, SemanticAnchors

__all__ = [
    "MemoryEntry",
    "DriftEngine",
    "CodeAnchor",
    "SemanticAnchors",
    "DriftVisualizer",
]
