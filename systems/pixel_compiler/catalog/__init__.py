"""
Visual Catalog Manager

Provides catalog scanning, thumbnail caching, and visual management
for .rts.png files.

Components:
- CatalogScanner: Discovers and catalogs .rts.png files
- CatalogEntry: Represents a catalog entry with metadata
- ThumbnailCache: Generates and caches visual thumbnails
- ThumbnailResult: Result of thumbnail generation
- SpatialLayoutManager: Drag-and-drop layout management
- SpatialPosition: Position information for catalog entries
"""

from .catalog_scanner import CatalogScanner, CatalogEntry
from .thumbnail_cache import ThumbnailCache, ThumbnailResult
from .spatial_layout import SpatialLayoutManager, SpatialPosition

__all__ = [
    # Catalog scanning
    "CatalogScanner",
    "CatalogEntry",
    # Thumbnail caching
    "ThumbnailCache",
    "ThumbnailResult",
    # Spatial layout
    "SpatialLayoutManager",
    "SpatialPosition",
]
