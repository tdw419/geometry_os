"""
Tests for VNC Backend (Stub) - TDD style.

Tests written BEFORE implementation following red-green-refactor cycle.
This tests the stub implementation - real VNC integration comes in Phase 2.
"""

import pytest
from unittest.mock import AsyncMock, patch, MagicMock
import asyncio

from systems.ai_gui.backends.base import InputEvent, InputEventType, AppConfig
from systems.ai_gui.tile_app_manager import TileState


class TestVNCBackend:
    """Tests for VNC Backend stub implementation."""

    @pytest.fixture
    def backend(self):
        """Create a VNCBackend instance."""
        from systems.ai_gui.backends.vnc_backend import VNCBackend
        return VNCBackend()

    @pytest.fixture
    def app_config(self):
        """Create a sample app config."""
        return AppConfig(
            app="gedit",
            backend="vnc",
            location=(100, 200),
            width=800,
            height=600
        )

    @pytest.fixture
    def mock_subprocess(self):
        """Mock asyncio.create_subprocess_exec for tests that don't need real processes."""
        with patch('asyncio.create_subprocess_exec') as mock:
            proc = MagicMock()
            proc.pid = 12345
            proc.returncode = None  # Process running
            proc.stdout = MagicMock()
            proc.stderr = MagicMock()
            proc.wait = AsyncMock(return_value=0)
            proc.terminate = MagicMock()
            proc.kill = MagicMock()
            mock.return_value = proc
            yield mock, proc

    # === Spawn Tests ===

    @pytest.mark.asyncio
    async def test_spawn_creates_tile(self, backend, app_config, mock_subprocess):
        """spawn() should create and return a tile."""
        tile = await backend.spawn(app_config)

        assert tile is not None
        assert tile.id is not None
        assert tile.app == "gedit"
        assert tile.backend == "vnc"
        assert tile.location == (100, 200)

    @pytest.mark.asyncio
    async def test_spawn_assigns_vnc_display(self, backend, app_config, mock_subprocess):
        """spawn() should assign a unique VNC display number."""
        tile1 = await backend.spawn(app_config)
        tile2 = await backend.spawn(AppConfig(app="calc", backend="vnc"))

        # Each tile should have a display number in metadata
        assert "vnc_display" in tile1.metadata
        assert "vnc_display" in tile2.metadata
        assert tile1.metadata["vnc_display"] != tile2.metadata["vnc_display"]

    @pytest.mark.asyncio
    async def test_spawn_logs_qemu_command(self, backend, app_config, mock_subprocess, caplog):
        """spawn() should log the QEMU command (stub - doesn't actually run)."""
        import logging
        with caplog.at_level(logging.DEBUG):
            tile = await backend.spawn(app_config)

        # Should have logged about QEMU (even if just a stub)
        assert any("qemu" in record.message.lower() or "spawn" in record.message.lower()
                   for record in caplog.records)

    @pytest.mark.asyncio
    async def test_spawn_sets_tile_state_to_running(self, backend, app_config, mock_subprocess):
        """spawn() should set tile state to RUNNING after spawn."""
        tile = await backend.spawn(app_config)

        assert tile.state == TileState.RUNNING

    # === Input Tests ===

    @pytest.mark.asyncio
    async def test_send_key_input_returns_true(self, backend, app_config, mock_subprocess):
        """send_input() for keys should return True."""
        tile = await backend.spawn(app_config)

        event = InputEvent(type=InputEventType.KEY, keys="A")
        result = await backend.send_input(tile.id, event)

        assert result is True

    @pytest.mark.asyncio
    async def test_send_mouse_input_returns_true(self, backend, app_config, mock_subprocess):
        """send_input() for mouse should return True."""
        tile = await backend.spawn(app_config)

        event = InputEvent(type=InputEventType.MOUSE, x=100, y=200, button=1)
        result = await backend.send_input(tile.id, event)

        assert result is True

    @pytest.mark.asyncio
    async def test_send_text_input_returns_true(self, backend, app_config, mock_subprocess):
        """send_input() for text should return True."""
        tile = await backend.spawn(app_config)

        event = InputEvent(type=InputEventType.TEXT, text="Hello")
        result = await backend.send_input(tile.id, event)

        assert result is True

    @pytest.mark.asyncio
    async def test_send_input_returns_false_for_unknown_tile(self, backend):
        """send_input() should return False for unknown tile ID."""
        event = InputEvent(type=InputEventType.KEY, keys="A")
        result = await backend.send_input("nonexistent_tile", event)

        assert result is False

    # === Frame Capture Tests ===

    @pytest.mark.asyncio
    async def test_capture_frame_returns_png_bytes(self, backend, app_config, mock_subprocess):
        """capture_frame() should return PNG bytes."""
        tile = await backend.spawn(app_config)

        result = await backend.capture_frame(tile.id)

        assert isinstance(result, bytes)
        # Should be valid PNG (or placeholder PNG for stub)
        assert result.startswith(b"\x89PNG")

    @pytest.mark.asyncio
    async def test_capture_frame_returns_none_for_unknown_tile(self, backend):
        """capture_frame() should return None for unknown tile ID."""
        result = await backend.capture_frame("nonexistent_tile")

        assert result is None

    @pytest.mark.asyncio
    async def test_capture_frame_stub_returns_placeholder(self, backend, app_config, mock_subprocess):
        """capture_frame() stub should return a placeholder image."""
        tile = await backend.spawn(app_config)

        result = await backend.capture_frame(tile.id)

        # Stub returns a placeholder 800x600 gray image
        assert len(result) > 0

    # === Terminate Tests ===

    @pytest.mark.asyncio
    async def test_terminate_returns_true(self, backend, app_config, mock_subprocess):
        """terminate() should return True for existing tile."""
        tile = await backend.spawn(app_config)

        result = await backend.terminate(tile.id)

        assert result is True

    @pytest.mark.asyncio
    async def test_terminate_returns_false_for_unknown(self, backend):
        """terminate() should return False for unknown tile ID."""
        result = await backend.terminate("nonexistent_tile")

        assert result is False

    @pytest.mark.asyncio
    async def test_terminate_removes_tile_from_backend(self, backend, app_config, mock_subprocess):
        """terminate() should remove tile from backend's internal registry."""
        tile = await backend.spawn(app_config)

        await backend.terminate(tile.id)

        # Health check should now fail
        result = await backend.health_check(tile.id)
        assert result is False

    # === Health Check Tests ===

    @pytest.mark.asyncio
    async def test_health_check_returns_true_for_running_tile(self, backend, app_config, mock_subprocess):
        """health_check() should return True for running tile."""
        tile = await backend.spawn(app_config)

        result = await backend.health_check(tile.id)

        assert result is True

    @pytest.mark.asyncio
    async def test_health_check_returns_false_for_unknown_tile(self, backend):
        """health_check() should return False for unknown tile ID."""
        result = await backend.health_check("nonexistent_tile")

        assert result is False

    # === Display Port Assignment Tests ===

    def test_vnc_display_starts_at_10(self, backend):
        """VNC displays should start at :10."""
        display = backend._get_next_vnc_display()

        assert display >= 10

    def test_vnc_display_increments(self, backend):
        """Each call to _get_next_vnc_display should increment."""
        display1 = backend._get_next_vnc_display()
        display2 = backend._get_next_vnc_display()

        assert display2 > display1

    # === Websockify Placeholder Tests ===

    @pytest.mark.asyncio
    async def test_websockify_port_assigned(self, backend, app_config, mock_subprocess):
        """spawn() should assign a websockify port."""
        tile = await backend.spawn(app_config)

        assert "websockify_port" in tile.metadata
        assert tile.metadata["websockify_port"] > 0

    # === Integration Tests ===

    @pytest.mark.asyncio
    async def test_full_lifecycle(self, backend, app_config, mock_subprocess):
        """Test full tile lifecycle: spawn -> input -> capture -> terminate."""
        # Spawn
        tile = await backend.spawn(app_config)
        assert tile.state == TileState.RUNNING

        # Health check
        assert await backend.health_check(tile.id)

        # Send input
        event = InputEvent(type=InputEventType.TEXT, text="test")
        assert await backend.send_input(tile.id, event)

        # Capture frame
        frame = await backend.capture_frame(tile.id)
        assert frame is not None

        # Terminate
        assert await backend.terminate(tile.id)
        assert not await backend.health_check(tile.id)
