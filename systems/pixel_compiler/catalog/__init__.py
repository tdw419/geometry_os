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
- CatalogServer: FastAPI server for catalog operations
"""

from .catalog_scanner import CatalogEntry, CatalogScanner
from .catalog_server import CatalogServer, app, get_catalog_server
from .spatial_layout import SpatialLayoutManager, SpatialPosition
from .thumbnail_cache import ThumbnailCache, ThumbnailResult

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
    # Catalog server
    "app",
    "CatalogServer",
    "get_catalog_server",
]
