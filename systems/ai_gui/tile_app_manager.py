"""
Tile App Manager for AI-GUI Control Surface.

Manages app tiles on the Infinite Map - lifecycle, registry, and coordination.
"""

import json
import uuid
from dataclasses import dataclass, field, asdict
from datetime import datetime
from pathlib import Path
from typing import Any, Optional
from enum import Enum
import logging

logger = logging.getLogger(__name__)


class TileState(Enum):
    """Possible states for a tile."""
    SPAWNING = "spawning"
    RUNNING = "running"
    IDLE = "idle"
    ERROR = "error"
    TERMINATED = "terminated"


@dataclass
class Tile:
    """Represents an app tile on the Infinite Map."""
    id: str
    app: str
    backend: str  # "vnc" | "wasm" | "native"
    location: tuple[int, int]
    state: TileState = TileState.SPAWNING
    created_at: datetime = field(default_factory=datetime.now)
    process: Any = None  # Backend-specific process handle
    width: int = 800
    height: int = 600
    metadata: dict = field(default_factory=dict)

    def to_dict(self) -> dict:
        """Convert tile to JSON-serializable dict."""
        return {
            "id": self.id,
            "app": self.app,
            "backend": self.backend,
            "location": list(self.location),
            "state": self.state.value,
            "created_at": self.created_at.isoformat(),
            "width": self.width,
            "height": self.height,
            "metadata": self.metadata,
        }

    @classmethod
    def from_dict(cls, data: dict) -> "Tile":
        """Create tile from dict (loaded from JSON)."""
        return cls(
            id=data["id"],
            app=data["app"],
            backend=data["backend"],
            location=tuple(data["location"]),
            state=TileState(data.get("state", "spawning")),
            created_at=datetime.fromisoformat(data.get("created_at", datetime.now().isoformat())),
            width=data.get("width", 800),
            height=data.get("height", 600),
            metadata=data.get("metadata", {}),
        )


class TileAppManager:
    """
    Manages app tiles on the Infinite Map.

    Responsibilities:
    - Tile registry (in-memory + JSON persistence)
    - App lifecycle: spawn, focus, close
    - Backend selection logic
    - Location assignment (auto or specified)
    """

    def __init__(self, persistence_path: Optional[str] = None):
        """
        Initialize the tile manager.

        Args:
            persistence_path: Path to JSON file for tile registry persistence
        """
        self._tiles: dict[str, Tile] = {}
        self._persistence_path = persistence_path
        self._next_location = (0, 0)  # Auto-assign starting position
        self._location_spacing = 900  # Space between auto-assigned tiles

        # Load existing tiles if persistence enabled
        if persistence_path and Path(persistence_path).exists():
            self._load_registry()

    def _load_registry(self):
        """Load tiles from persistence file."""
        try:
            with open(self._persistence_path) as f:
                data = json.load(f)
            for tile_data in data.get("tiles", []):
                tile = Tile.from_dict(tile_data)
                self._tiles[tile.id] = tile
            logger.info(f"Loaded {len(self._tiles)} tiles from {self._persistence_path}")
        except Exception as e:
            logger.warning(f"Failed to load tile registry: {e}")

    async def save_registry(self):
        """Save tiles to persistence file."""
        if not self._persistence_path:
            return

        data = {
            "tiles": [t.to_dict() for t in self._tiles.values()],
            "next_location": list(self._next_location),
        }

        with open(self._persistence_path, 'w') as f:
            json.dump(data, f, indent=2)
        logger.debug(f"Saved {len(self._tiles)} tiles to {self._persistence_path}")

    def _generate_tile_id(self) -> str:
        """Generate a unique tile ID."""
        return f"tile_{uuid.uuid4().hex[:8]}"

    def _auto_assign_location(self) -> tuple[int, int]:
        """Auto-assign a location for a new tile."""
        x, y = self._next_location
        # Grid-based placement
        self._next_location = (x + self._location_spacing, y)
        return (x, y)

    def _select_backend(self, app: str, requested: str) -> str:
        """Select the appropriate backend for an app."""
        if requested != "auto":
            return requested

        # Default to VNC for now (will be enhanced with app registry)
        # Future: check app registry for optimal backend
        logger.debug(f"Auto-selecting backend for {app}: vnc (default)")
        return "vnc"

    async def launch_app(
        self,
        app: str,
        backend: str = "auto",
        location: Optional[tuple[int, int]] = None
    ) -> Tile:
        """
        Launch an app as a tile on the map.

        Args:
            app: Application name or command
            backend: Backend type ("vnc", "wasm", "native", or "auto")
            location: Optional (x, y) position; auto-assigned if None

        Returns:
            Tile object representing the launched app
        """
        # Select backend
        selected_backend = self._select_backend(app, backend)

        # Auto-assign location if not specified
        if location is None:
            location = self._auto_assign_location()

        # Create tile
        tile_id = self._generate_tile_id()
        tile = Tile(
            id=tile_id,
            app=app,
            backend=selected_backend,
            location=location,
            state=TileState.SPAWNING,
        )

        # Register tile
        self._tiles[tile_id] = tile
        logger.info(f"Launched tile {tile_id} for {app} at {location} via {selected_backend}")

        # Simulate spawn completion (in real implementation, backend would do this)
        tile.state = TileState.RUNNING

        # Persist
        await self.save_registry()

        return tile

    async def focus_tile(self, tile_id: str) -> bool:
        """
        Focus a specific tile.

        Args:
            tile_id: Unique tile identifier

        Returns:
            True if tile was focused, False if not found
        """
        tile = self._tiles.get(tile_id)
        if not tile:
            logger.warning(f"Cannot focus tile {tile_id}: not found")
            return False

        # In real implementation, this would notify the PixiJS map to bring tile to front
        logger.info(f"Focused tile {tile_id}")
        return True

    async def close_tile(self, tile_id: str, force: bool = False) -> bool:
        """
        Close a tile.

        Args:
            tile_id: Unique tile identifier
            force: If True, force terminate even if busy

        Returns:
            True if tile was closed, False if not found
        """
        tile = self._tiles.get(tile_id)
        if not tile:
            logger.warning(f"Cannot close tile {tile_id}: not found")
            return False

        # In real implementation, this would call backend.terminate()
        tile.state = TileState.TERMINATED

        # Remove from registry
        del self._tiles[tile_id]
        logger.info(f"Closed tile {tile_id} (force={force})")

        # Persist
        await self.save_registry()

        return True

    async def list_tiles(self) -> list[Tile]:
        """List all active tiles."""
        return list(self._tiles.values())

    async def get_tile(self, tile_id: str) -> Optional[Tile]:
        """Get a specific tile by ID."""
        return self._tiles.get(tile_id)
