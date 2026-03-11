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
    ContextualMemory,
    ContextualMemoryDB,
    ContextVectorGenerator,
    GoalInferenceEngine,
    GoalPrediction,
    GoalType,
    MatchResult,
    Pattern,
    PatternMatcher,
    SignalContext,
)

# Directive modules (Command Console)
from .directive_agent import (
    Directive,
    DirectiveAgent,
    DirectiveScope,
    DirectiveStatus,
)

# Learning modules
from .learning import (
    FeedbackLearner,
    FeedbackRecord,
    FeedbackType,
    PersonalizationEngine,
    TemporalDecay,
    UserProfile,
)

# Orchestration modules
from .orchestration import (
    Actor,
    DomainMemorySnapshot,
    MemoryOrchestrator,
    ProactiveAssistant,
    StageManager,
    Task,
    TaskStatus,
)

# Testing modules
from .testing import (
    ABConsciousnessIntegration,
    ABTestingEngine,
    TestResult,
    Variant,
    VariantType,
    simulate_user_interaction,
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
]
