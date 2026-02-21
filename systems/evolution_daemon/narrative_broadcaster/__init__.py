"""
Narrative Broadcaster - GOSR Radio

Geometry OS Radio Station (GOSR) for 24/7 autonomous narrative broadcasting.
Transforms OS telemetry into diverse, non-repeating narrative content.

Components:
- NarrativeBroadcaster: Main orchestrator
- BroadcastSegment: Content data structure
- TopicMemory: Deduplication with embeddings
- SegmentPool: Content generation
- PersonalityEngine: Station voices
"""

from .broadcaster import NarrativeBroadcaster, BroadcastSegment

__all__ = [
    'NarrativeBroadcaster',
    'BroadcastSegment',
]

__version__ = '1.0.0'
