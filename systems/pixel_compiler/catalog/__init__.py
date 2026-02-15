"""
Visual Catalog Package

Provides spatial layout management for catalog entries with
drag-and-drop support and session persistence.
"""

from .spatial_layout import SpatialLayoutManager, SpatialPosition

__all__ = ["SpatialLayoutManager", "SpatialPosition"]
