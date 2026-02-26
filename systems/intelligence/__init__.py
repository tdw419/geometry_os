"""
Geometry OS Intelligence Layer
Phase 25: Goal Inference & Proactive Assistance

This module provides proactive intelligence capabilities.

Author: Phase 25 Structural Health Improvements
Date: January 21, 2026
"""

# RPE Stability Suite - Safe Recursive Prompt Evolution
from .prompt_version_manager import (
    PromptVersionManager,
    PromptVersion,
    RollbackResult,
)
from .prompt_validator import (
    PromptValidator,
    ValidationResult,
    RoleConstraint,
    GEOMETRY_OS_ARCHITECT,
)
from .evolution_budget import (
    EvolutionBudget,
)

__all__ = [
    # RPE Stability Suite
    "PromptVersionManager",
    "PromptVersion",
    "RollbackResult",
    "PromptValidator",
    "ValidationResult",
    "RoleConstraint",
    "GEOMETRY_OS_ARCHITECT",
    "EvolutionBudget",
]
