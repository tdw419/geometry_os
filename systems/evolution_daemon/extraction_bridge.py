"""
Extraction Bridge - Integrates Visual Extraction Pipeline with Evolution Daemon.

Provides a bridge to run GUI extraction on Live Tile screenshots and 
broadcast semantic UI data to the frontend.
"""
import os
import sys
import logging
import asyncio
from pathlib import Path
from typing import Dict, Any, Optional

# Add the extraction track to sys.path to allow imports
TRACK_PATH = Path("/home/jericho/zion/projects/geometry_os/geometry_os/conductor/tracks/shotcut-on-the-map")
if str(TRACK_PATH) not in sys.path:
    sys.path.insert(0, str(TRACK_PATH))

try:
    from extraction_pipeline import ExtractionPipeline
except ImportError:
    ExtractionPipeline = None
    logging.warning("ExtractionPipeline not found in TRACK_PATH. Semantic extraction disabled.")

logger = logging.getLogger("evolution_daemon.extraction_bridge")

class ExtractionBridge:
    """
    Bridge between LiveTile screenshots and the Visual Extraction Pipeline.
    """
    def __init__(self, webmcp=None):
        self.webmcp = webmcp
        self.pipeline = ExtractionPipeline() if ExtractionPipeline else None
        self._is_busy = False

    def set_webmcp(self, webmcp):
        """Set WebMCP for broadcasting results."""
        self.webmcp = webmcp

    async def extract_tile_semantics(self, tile_id: str, image_path: str) -> Optional[Dict[str, Any]]:
        """
        Run extraction on a tile's screenshot and broadcast results.
        
        Args:
            tile_id: The ID of the tile being analyzed
            image_path: Path to the screenshot file
            
        Returns:
            Dict containing widgets, clickables, and metadata
        """
        if not self.pipeline:
            return None
            
        if self._is_busy:
            # Skip if already processing to avoid flooding
            return None

        self._is_busy = True
        try:
            # Run extraction in a separate thread to avoid blocking the event loop
            loop = asyncio.get_event_loop()
            result = await loop.run_in_executor(None, self.pipeline.extract, str(image_path))
            
            data = result.to_dict()
            
            # Broadcast the result via WebMCP
            if self.webmcp:
                await self.webmcp.broadcast_event("tile_extraction_result", {
                    "tile_id": tile_id,
                    "widgets": data["widgets"],
                    "clickable_count": data["metadata"]["clickable_count"],
                    "ascii_view": data["ascii_view"]
                })
                
            return data
        except Exception as e:
            logger.error(f"Extraction failed for tile {tile_id}: {e}")
            return None
        finally:
            self._is_busy = False

# Singleton instance
_bridge = None

def get_extraction_bridge(webmcp=None) -> ExtractionBridge:
    global _bridge
    if _bridge is None:
        _bridge = ExtractionBridge(webmcp)
    elif webmcp:
        _bridge.set_webmcp(webmcp)
    return _bridge
