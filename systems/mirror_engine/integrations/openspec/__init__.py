"""
OpenSpec/AutoResearch Integration for Mirror Engine

Uses EXISTING framework from openspec+autoresearch:
- ASCIISpecParser
- ASCIISpecRenderer
- ASCIIExperimentRuntime

Adds ONE bridge file:
- GeometryBridge (converts ASCII → Geometry tokens)
"""

from .geometry_bridge import GeometryBridge

__all__ = ['GeometryBridge']
