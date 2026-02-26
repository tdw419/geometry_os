"""
Geometry OS Intelligence Layer
Phase 25: Goal Inference & Proactive Assistance

This module provides proactive intelligence capabilities organized into:
- Core: Foundational components (memory, patterns, goal inference)
- Learning: Adaptive learning and personalization
- Testing: A/B testing and validation
- Orchestration: Workflow coordination and task management
- Demos: Demonstration scripts

Author: Phase 25 Structural Health Improvements
Date: January 21, 2026
"""

# Core modules
from .core import (
    ContextualMemoryDB,
    ContextualMemory,
    Pattern,
    PatternMatcher,
    MatchResult,
    GoalInferenceEngine,
    GoalPrediction,
    GoalType,
    SignalContext,
    ContextVectorGenerator,
)

# Learning modules
from .learning import (
    FeedbackLearner,
    FeedbackType,
    FeedbackRecord,
    PersonalizationEngine,
    UserProfile,
    TemporalDecay,
)

# Testing modules
from .testing import (
    ABTestingEngine,
    VariantType,
    Variant,
    TestResult,
    simulate_user_interaction,
    ABConsciousnessIntegration,
)

# Orchestration modules
from .orchestration import (
    MemoryOrchestrator,
    StageManager,
    Actor,
    Task,
    TaskStatus,
    DomainMemorySnapshot,
    ProactiveAssistant,
)

# Directive modules (Command Console)
from .directive_agent import (
    DirectiveAgent,
    DirectiveScope,
    DirectiveStatus,
    Directive,
)

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
    # Core
    "ContextualMemoryDB",
    "ContextualMemory",
    "Pattern",
    "PatternMatcher",
    "MatchResult",
    "GoalInferenceEngine",
    "GoalPrediction",
    "GoalType",
    "SignalContext",
    "ContextVectorGenerator",
    # Learning
    "FeedbackLearner",
    "FeedbackType",
    "FeedbackRecord",
    "PersonalizationEngine",
    "UserProfile",
    "TemporalDecay",
    # Testing
    "ABTestingEngine",
    "VariantType",
    "Variant",
    "TestResult",
    "simulate_user_interaction",
    "ABConsciousnessIntegration",
    "PersonalizationReflection",
    # Orchestration
    "MemoryOrchestrator",
    "StageManager",
    "Actor",
    "Task",
    "TaskStatus",
    "DomainMemorySnapshot",
    "ProactiveAssistant",
    # Directive (Command Console)
    "DirectiveAgent",
    "DirectiveScope",
    "DirectiveStatus",
    "Directive",
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
