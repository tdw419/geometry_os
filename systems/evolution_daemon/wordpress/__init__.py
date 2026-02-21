"""
WordPress integration for Evolution Daemon.

This module provides components for analyzing and improving WordPress content
through the evolution daemon's autonomous improvement pipeline.
"""

from .content_analyzer import (
    ContentAnalysis,
    ImprovementProposal,
    WordPressContentAnalyzer,
)

__all__ = [
    "ContentAnalysis",
    "ImprovementProposal",
    "WordPressContentAnalyzer",
]
