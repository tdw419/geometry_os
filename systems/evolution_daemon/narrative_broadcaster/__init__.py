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

from .broadcaster import NarrativeBroadcaster, BroadcastSegment
from .topic_memory import TopicMemory, TopicEntry
from .segment_pool import SegmentPool, SegmentType, SegmentConfig
from .feedback_orchestrator import FeedbackOrchestrator, FeedbackSignal

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
]

__version__ = '1.0.0'
