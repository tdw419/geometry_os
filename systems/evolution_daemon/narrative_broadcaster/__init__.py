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
- LLMNarrativeClient: LM Studio integration for AI content
- WordPressPublisher: WordPress REST API publishing
"""

from .broadcaster import NarrativeBroadcaster, BroadcastSegment
from .topic_memory import TopicMemory, TopicEntry
from .segment_pool import SegmentPool, SegmentType, SegmentConfig
from .feedback_orchestrator import FeedbackOrchestrator, FeedbackSignal
from .llm_client import LLMNarrativeClient, LLMConfig
from .wordpress_publisher import WordPressPublisher, WordPressConfig

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
    'WordPressPublisher',
    'WordPressConfig',
]

__version__ = '2.1.0'
