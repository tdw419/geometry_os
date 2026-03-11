"""
Narrative Broadcaster - GOSR Radio

Geometry OS Radio Station (GOSR) for 24/7 autonomous narrative broadcasting.
Transforms OS telemetry into diverse, non-repeating narrative content.

Components:
- NarrativeBroadcaster: Main orchestrator
- BroadcastSegment: Content data structure
- TopicMemory: Deduplication with embeddings
- TopicEntry: Topic data structure
- SegmentPool: Content generation
- PersonalityEngine: Station voices
- FeedbackOrchestrator: Evolution integration
"""

from .broadcaster import BroadcastSegment, NarrativeBroadcaster
from .feedback_orchestrator import FeedbackOrchestrator, FeedbackSignal
from .llm_client import LLMConfig, LLMNarrativeClient
from .segment_pool import SegmentConfig, SegmentPool, SegmentType
from .topic_memory import TopicEntry, TopicMemory

__all__ = [
    'NarrativeBroadcaster',
    'BroadcastSegment',
    'TopicMemory',
    'TopicEntry',
    'SegmentPool',
    'SegmentType',
    'SegmentConfig',
    'FeedbackOrchestrator',
    'FeedbackSignal',
    'LLMNarrativeClient',
    'LLMConfig',
]

__version__ = '1.0.0'
