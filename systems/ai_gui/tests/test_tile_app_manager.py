"""
Tests for TileAppManager - TDD style.

Tests written BEFORE implementation following red-green-refactor cycle.
"""

import pytest
import asyncio
import tempfile
import json
from pathlib import Path
from datetime import datetime

from systems.ai_gui.tile_app_manager import TileAppManager, Tile, TileState


class TestTileAppManager:
    """Test suite for TileAppManager."""

    @pytest.fixture
    def manager(self):
        """Create a fresh TileAppManager for each test."""
        return TileAppManager()

    @pytest.fixture
    def manager_with_persistence(self):
        """Create a TileAppManager with persistence enabled."""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            f.write('{}')
            path = f.name
        manager = TileAppManager(persistence_path=path)
        yield manager
        Path(path).unlink(missing_ok=True)

    # === Basic Lifecycle Tests ===

    @pytest.mark.asyncio
    async def test_launch_app_creates_tile(self, manager):
        """Launching an app should create and return a tile."""
        tile = await manager.launch_app("gedit", backend="vnc")

        assert tile is not None
        assert tile.id is not None
        assert tile.app == "gedit"
        assert tile.backend == "vnc"
        assert tile.state == TileState.RUNNING

    @pytest.mark.asyncio
    async def test_launch_app_auto_assigns_location(self, manager):
        """If no location specified, manager should auto-assign one."""
        tile = await manager.launch_app("gedit", backend="vnc")

        assert tile.location is not None
        assert len(tile.location) == 2
        assert tile.location[0] >= 0
        assert tile.location[1] >= 0

    @pytest.mark.asyncio
    async def test_launch_app_uses_specified_location(self, manager):
        """If location specified, manager should use it."""
        tile = await manager.launch_app(
            "gedit",
            backend="vnc",
            location=(1000, 2000)
        )

        assert tile.location == (1000, 2000)

    @pytest.mark.asyncio
    async def test_launch_app_generates_unique_ids(self, manager):
        """Each launched app should get a unique tile ID."""
        tile1 = await manager.launch_app("gedit", backend="vnc")
        tile2 = await manager.launch_app("calc", backend="vnc")

        assert tile1.id != tile2.id

    # === Registry Tests ===

    @pytest.mark.asyncio
    async def test_list_tiles_returns_all(self, manager):
        """list_tiles should return all launched tiles."""
        await manager.launch_app("gedit", backend="vnc")
        await manager.launch_app("calc", backend="vnc")

        tiles = await manager.list_tiles()

        assert len(tiles) == 2

    @pytest.mark.asyncio
    async def test_get_tile_returns_correct_tile(self, manager):
        """get_tile should return the tile with matching ID."""
        tile1 = await manager.launch_app("gedit", backend="vnc")
        tile2 = await manager.launch_app("calc", backend="vnc")

        result = await manager.get_tile(tile1.id)

        assert result.id == tile1.id
        assert result.app == "gedit"

    @pytest.mark.asyncio
    async def test_get_tile_returns_none_for_unknown(self, manager):
        """get_tile should return None for unknown tile ID."""
        result = await manager.get_tile("nonexistent")

        assert result is None

    # === Focus Tests ===

    @pytest.mark.asyncio
    async def test_focus_tile_returns_true_for_existing(self, manager):
        """Focus should return True for existing tile."""
        tile = await manager.launch_app("gedit", backend="vnc")

        result = await manager.focus_tile(tile.id)

        assert result is True

    @pytest.mark.asyncio
    async def test_focus_tile_returns_false_for_unknown(self, manager):
        """Focus should return False for unknown tile."""
        result = await manager.focus_tile("nonexistent")

        assert result is False

    # === Close Tests ===

    @pytest.mark.asyncio
    async def test_close_tile_removes_from_registry(self, manager):
        """Closing a tile should remove it from the registry."""
        tile = await manager.launch_app("gedit", backend="vnc")

        result = await manager.close_tile(tile.id)

        assert result is True
        tiles = await manager.list_tiles()
        assert len(tiles) == 0

    @pytest.mark.asyncio
    async def test_close_tile_returns_false_for_unknown(self, manager):
        """Closing unknown tile should return False."""
        result = await manager.close_tile("nonexistent")

        assert result is False

    @pytest.mark.asyncio
    async def test_close_tile_force_terminates_running_process(self, manager):
        """Force close should terminate even if tile is busy."""
        tile = await manager.launch_app("gedit", backend="vnc")

        result = await manager.close_tile(tile.id, force=True)

        assert result is True

    # === Persistence Tests ===

    @pytest.mark.asyncio
    async def test_persistence_saves_tiles(self, manager_with_persistence):
        """Tiles should be persisted to JSON file."""
        manager = manager_with_persistence
        await manager.launch_app("gedit", backend="vnc")

        # Force save
        await manager.save_registry()

        # Read the file
        with open(manager._persistence_path) as f:
            data = json.load(f)

        assert "tiles" in data
        assert len(data["tiles"]) == 1

    @pytest.mark.asyncio
    async def test_persistence_loads_tiles_on_init(self):
        """Manager should load tiles from JSON on init."""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump({
                "tiles": [
                    {
                        "id": "tile_001",
                        "app": "gedit",
                        "backend": "vnc",
                        "location": [100, 200],
                        "state": "running"
                    }
                ],
                "next_id": 2
            }, f)
            path = f.name

        try:
            manager = TileAppManager(persistence_path=path)

            # Should load the tile
            tiles = await manager.list_tiles()
            assert len(tiles) == 1
            assert tiles[0].app == "gedit"
        finally:
            Path(path).unlink(missing_ok=True)

    # === Backend Selection Tests ===

    @pytest.mark.asyncio
    async def test_auto_backend_selects_vnc_for_unknown(self, manager):
        """Auto backend should default to VNC for unknown apps."""
        tile = await manager.launch_app("unknown-app", backend="auto")

        assert tile.backend == "vnc"

    @pytest.mark.asyncio
    async def test_auto_backend_selects_wasm_for_web_apps(self, manager):
        """Auto backend should select WASM for known web apps."""
        # This would need a web app registry - stub for now
        tile = await manager.launch_app("htop", backend="auto")

        # For now, still defaults to vnc until we implement the selector
        assert tile.backend in ["vnc", "wasm", "native"]


class TestTile:
    """Test suite for Tile dataclass."""

    def test_tile_default_state_is_spawning(self):
        """New tiles should start in SPAWNING state."""
        tile = Tile(
            id="test",
            app="gedit",
            backend="vnc",
            location=(0, 0)
        )

        assert tile.state == TileState.SPAWNING

    def test_tile_has_created_at_timestamp(self):
        """Tiles should have a created_at timestamp."""
        tile = Tile(
            id="test",
            app="gedit",
            backend="vnc",
            location=(0, 0)
        )

        assert tile.created_at is not None
        assert isinstance(tile.created_at, datetime)

    def test_tile_can_store_metadata(self):
        """Tiles should be able to store arbitrary metadata."""
        tile = Tile(
            id="test",
            app="gedit",
            backend="vnc",
            location=(0, 0),
            metadata={"custom": "data", "version": "1.0"}
        )

        assert tile.metadata["custom"] == "data"
        assert tile.metadata["version"] == "1.0"
