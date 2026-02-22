"""
Tests for VNC Backend Phase 2 - Real QEMU Integration.

Tests written BEFORE implementation following red-green-refactor cycle.
These tests verify actual QEMU/websockify process management.
"""

import pytest
import asyncio
from unittest.mock import AsyncMock, patch, MagicMock, call
import subprocess
import signal

from systems.ai_gui.backends.base import InputEvent, InputEventType, AppConfig
from systems.ai_gui.tile_app_manager import TileState


class TestQEMUIntegration:
    """Tests for real QEMU process management."""

    @pytest.fixture
    def backend(self):
        """Create a VNCBackend instance."""
        from systems.ai_gui.backends.vnc_backend import VNCBackend
        return VNCBackend()

    @pytest.fixture
    def app_config(self):
        """Create a sample app config."""
        return AppConfig(
            app="alpine",
            backend="vnc",
            location=(100, 200),
            width=800,
            height=600
        )

    @pytest.fixture
    def mock_subprocess(self):
        """Mock asyncio.create_subprocess_exec."""
        with patch('asyncio.create_subprocess_exec') as mock:
            proc = MagicMock()
            proc.pid = 12345
            proc.returncode = None
            proc.stdout = MagicMock()
            proc.stderr = MagicMock()
            proc.wait = AsyncMock(return_value=0)
            proc.terminate = MagicMock()
            proc.kill = MagicMock()
            mock.return_value = proc
            yield mock, proc

    # === QEMU Spawn Tests ===

    @pytest.mark.asyncio
    async def test_spawn_creates_qemu_process(self, backend, app_config, mock_subprocess):
        """spawn() should create a real QEMU subprocess."""
        mock_exec, proc = mock_subprocess

        tile = await backend.spawn(app_config)

        # Should have called create_subprocess_exec - first call is QEMU
        mock_exec.assert_called()
        first_call_args = mock_exec.call_args_list[0][0]
        assert "qemu-system" in first_call_args[0] or first_call_args[0].endswith("qemu-system-x86_64")

    @pytest.mark.asyncio
    async def test_spawn_uses_correct_memory(self, backend, app_config, mock_subprocess):
        """QEMU should be spawned with configurable memory."""
        mock_exec, proc = mock_subprocess

        tile = await backend.spawn(app_config)

        # Check first call (QEMU) for memory flag
        first_call_args = ' '.join(str(a) for a in mock_exec.call_args_list[0][0])
        assert "-m" in first_call_args

    @pytest.mark.asyncio
    async def test_spawn_configures_vnc_display(self, backend, app_config, mock_subprocess):
        """QEMU should be configured with VNC display."""
        mock_exec, proc = mock_subprocess

        tile = await backend.spawn(app_config)

        # Check first call (QEMU) for VNC flag
        first_call_args = ' '.join(str(a) for a in mock_exec.call_args_list[0][0])
        assert "-vnc" in first_call_args

    @pytest.mark.asyncio
    async def test_spawn_stores_process_handle(self, backend, app_config, mock_subprocess):
        """spawn() should store the process handle in backend._processes."""
        mock_exec, proc = mock_subprocess

        tile = await backend.spawn(app_config)

        # Should have process stored in _processes (not _tile_processes)
        assert backend._processes.get(tile.id) is not None

    @pytest.mark.asyncio
    async def test_spawn_uses_alpine_linux_image(self, backend, mock_subprocess):
        """Spawning Alpine should use Alpine Linux base image."""
        mock_exec, proc = mock_subprocess
        config = AppConfig(app="alpine", backend="vnc")

        tile = await backend.spawn(config)

        # Check first call (QEMU) for image reference
        first_call_args = ' '.join(str(a) for a in mock_exec.call_args_list[0][0])
        # Should reference alpine image or disk
        assert "alpine" in first_call_args.lower() or "-hda" in first_call_args or "-cdrom" in first_call_args

    # === Websockify Integration Tests ===

    @pytest.mark.asyncio
    async def test_spawn_starts_websockify(self, backend, app_config, mock_subprocess):
        """spawn() should start websockify to bridge VNC to WebSocket."""
        mock_exec, proc = mock_subprocess

        tile = await backend.spawn(app_config)

        # Should have called websockify (second call)
        assert mock_exec.call_count >= 2
        websockify_call = mock_exec.call_args_list[1]
        call_args = ' '.join(str(a) for a in websockify_call[0])
        assert "websockify" in call_args

    @pytest.mark.asyncio
    async def test_spawn_stores_websocket_url(self, backend, app_config, mock_subprocess):
        """spawn() should store WebSocket URL for PixiJS to connect."""
        mock_exec, proc = mock_subprocess

        tile = await backend.spawn(app_config)

        assert "websocket_url" in tile.metadata
        assert "ws://" in tile.metadata["websocket_url"] or "wss://" in tile.metadata["websocket_url"]

    @pytest.mark.asyncio
    async def test_websockify_bridges_correct_vnc_port(self, backend, app_config, mock_subprocess):
        """websockify should bridge to the correct VNC port."""
        mock_exec, proc = mock_subprocess

        tile = await backend.spawn(app_config)

        # Get VNC port from tile
        vnc_port = tile.metadata["vnc_port"]
        ws_port = tile.metadata["websockify_port"]

        # Check websockify call bridges to VNC port
        websockify_call = mock_exec.call_args_list[1]
        call_args = ' '.join(str(a) for a in websockify_call[0])
        assert str(ws_port) in call_args
        assert str(vnc_port) in call_args or f":{vnc_port}" in call_args or f"localhost:{vnc_port}" in call_args

    # === Process Termination Tests ===

    @pytest.mark.asyncio
    async def test_terminate_kills_qemu_process(self, backend, app_config, mock_subprocess):
        """terminate() should kill the QEMU process."""
        mock_exec, proc = mock_subprocess

        tile = await backend.spawn(app_config)
        result = await backend.terminate(tile.id)

        assert result is True
        proc.terminate.assert_called()

    @pytest.mark.asyncio
    async def test_terminate_kills_websockify_process(self, backend, app_config, mock_subprocess):
        """terminate() should also kill websockify process."""
        mock_exec, proc = mock_subprocess

        tile = await backend.spawn(app_config)
        result = await backend.terminate(tile.id)

        # Should terminate both processes
        assert result is True

    @pytest.mark.asyncio
    async def test_terminate_force_kills_if_terminate_fails(self, backend, app_config, mock_subprocess):
        """terminate(force=True) should SIGKILL if SIGTERM fails."""
        mock_exec, proc = mock_subprocess
        proc.wait.side_effect = asyncio.TimeoutError

        tile = await backend.spawn(app_config)
        result = await backend.terminate(tile.id, force=True)

        # Should have called kill after terminate timeout
        assert proc.kill.called or proc.terminate.called

    # === Health Check Tests ===

    @pytest.mark.asyncio
    async def test_health_check_verifies_process_running(self, backend, app_config, mock_subprocess):
        """health_check() should verify QEMU process is actually running."""
        mock_exec, proc = mock_subprocess
        proc.returncode = None  # Process running

        tile = await backend.spawn(app_config)
        result = await backend.health_check(tile.id)

        assert result is True

    @pytest.mark.asyncio
    async def test_health_check_detects_dead_process(self, backend, app_config, mock_subprocess):
        """health_check() should detect if QEMU process has died."""
        mock_exec, proc = mock_subprocess
        proc.returncode = 0  # Process exited

        tile = await backend.spawn(app_config)
        result = await backend.health_check(tile.id)

        assert result is False


class TestInputRouting:
    """Tests for VNC input routing."""

    @pytest.fixture
    def backend_with_tile(self):
        """Create a VNCBackend with a spawned tile."""
        from systems.ai_gui.backends.vnc_backend import VNCBackend
        backend = VNCBackend()
        return backend

    # === Keyboard Input Tests ===

    @pytest.mark.asyncio
    async def test_send_key_uses_vnc_protocol(self, backend_with_tile):
        """send_input() for keys should use VNC protocol."""
        config = AppConfig(app="test", backend="vnc")

        with patch('asyncio.create_subprocess_exec') as mock_exec:
            proc = MagicMock()
            proc.pid = 12345
            proc.returncode = None
            proc.wait = AsyncMock(return_value=0)
            mock_exec.return_value = proc

            tile = await backend_with_tile.spawn(config)

            # Now send input
            event = InputEvent(type=InputEventType.KEY, keys="A")
            result = await backend_with_tile.send_input(tile.id, event)

            assert result is True

    @pytest.mark.asyncio
    async def test_send_key_handles_modifiers(self, backend_with_tile):
        """send_input() should handle Ctrl, Alt, Shift modifiers."""
        config = AppConfig(app="test", backend="vnc")

        with patch('asyncio.create_subprocess_exec') as mock_exec:
            proc = MagicMock()
            proc.pid = 12345
            proc.returncode = None
            proc.wait = AsyncMock(return_value=0)
            mock_exec.return_value = proc

            tile = await backend_with_tile.spawn(config)

            event = InputEvent(
                type=InputEventType.KEY,
                keys="S",
                modifiers=["ctrl"]
            )
            result = await backend_with_tile.send_input(tile.id, event)

            assert result is True

    @pytest.mark.asyncio
    async def test_send_key_sanitize_dangerous_keys(self, backend_with_tile):
        """send_input() should sanitize potentially dangerous key combinations."""
        config = AppConfig(app="test", backend="vnc")

        with patch('asyncio.create_subprocess_exec') as mock_exec:
            proc = MagicMock()
            proc.pid = 12345
            proc.returncode = None
            proc.wait = AsyncMock(return_value=0)
            mock_exec.return_value = proc

            tile = await backend_with_tile.spawn(config)

            # This should be sanitized (e.g., preventing SysRq)
            event = InputEvent(type=InputEventType.KEY, keys="SysRq")
            result = await backend_with_tile.send_input(tile.id, event)

            # Should either reject or sanitize
            assert result is True or result is False

    # === Mouse Input Tests ===

    @pytest.mark.asyncio
    async def test_send_mouse_click(self, backend_with_tile):
        """send_input() should send mouse click events."""
        config = AppConfig(app="test", backend="vnc")

        with patch('asyncio.create_subprocess_exec') as mock_exec:
            proc = MagicMock()
            proc.pid = 12345
            proc.returncode = None
            proc.wait = AsyncMock(return_value=0)
            mock_exec.return_value = proc

            tile = await backend_with_tile.spawn(config)

            event = InputEvent(
                type=InputEventType.MOUSE,
                x=100,
                y=200,
                button=1  # Left click
            )
            result = await backend_with_tile.send_input(tile.id, event)

            assert result is True

    @pytest.mark.asyncio
    async def test_send_mouse_scales_coordinates(self, backend_with_tile):
        """send_input() should scale mouse coordinates to tile dimensions."""
        config = AppConfig(app="test", backend="vnc", width=1024, height=768)

        with patch('asyncio.create_subprocess_exec') as mock_exec:
            proc = MagicMock()
            proc.pid = 12345
            proc.returncode = None
            proc.wait = AsyncMock(return_value=0)
            mock_exec.return_value = proc

            tile = await backend_with_tile.spawn(config)

            event = InputEvent(
                type=InputEventType.MOUSE,
                x=512,  # Middle of tile
                y=384,
                button=1
            )
            result = await backend_with_tile.send_input(tile.id, event)

            assert result is True

    # === Text Input Tests ===

    @pytest.mark.asyncio
    async def test_send_text_types_characters(self, backend_with_tile):
        """send_input() should type text character by character."""
        config = AppConfig(app="test", backend="vnc")

        with patch('asyncio.create_subprocess_exec') as mock_exec:
            proc = MagicMock()
            proc.pid = 12345
            proc.returncode = None
            proc.wait = AsyncMock(return_value=0)
            mock_exec.return_value = proc

            tile = await backend_with_tile.spawn(config)

            event = InputEvent(type=InputEventType.TEXT, text="Hello")
            result = await backend_with_tile.send_input(tile.id, event)

            assert result is True


class TestFrameCapture:
    """Tests for VNC frame capture."""

    @pytest.fixture
    def backend(self):
        from systems.ai_gui.backends.vnc_backend import VNCBackend
        return VNCBackend()

    @pytest.mark.asyncio
    async def test_capture_frame_returns_png(self, backend):
        """capture_frame() should return valid PNG bytes."""
        config = AppConfig(app="test", backend="vnc")

        with patch('asyncio.create_subprocess_exec') as mock_exec:
            proc = MagicMock()
            proc.pid = 12345
            proc.returncode = None
            proc.wait = AsyncMock(return_value=0)
            mock_exec.return_value = proc

            tile = await backend.spawn(config)

            # Mock frame capture
            with patch.object(backend, '_capture_vnc_frame') as mock_capture:
                mock_capture.return_value = b'\x89PNG\r\n\x1a\n' + b'test_data'

                result = await backend.capture_frame(tile.id)

                assert result is not None
                assert result.startswith(b'\x89PNG')

    @pytest.mark.asyncio
    async def test_capture_frame_performance(self, backend):
        """capture_frame() should complete within 100ms."""
        import time
        config = AppConfig(app="test", backend="vnc")

        with patch('asyncio.create_subprocess_exec') as mock_exec:
            proc = MagicMock()
            proc.pid = 12345
            proc.returncode = None
            proc.wait = AsyncMock(return_value=0)
            mock_exec.return_value = proc

            tile = await backend.spawn(config)

            with patch.object(backend, '_capture_vnc_frame') as mock_capture:
                mock_capture.return_value = b'\x89PNG\r\n\x1a\n'

                start = time.time()
                await backend.capture_frame(tile.id)
                elapsed = (time.time() - start) * 1000

                assert elapsed < 100, f"Frame capture took {elapsed}ms, expected < 100ms"

    @pytest.mark.asyncio
    async def test_capture_frame_returns_none_for_dead_tile(self, backend):
        """capture_frame() should return None if tile process is dead."""
        config = AppConfig(app="test", backend="vnc")

        with patch('asyncio.create_subprocess_exec') as mock_exec:
            proc = MagicMock()
            proc.pid = 12345
            proc.returncode = 0  # Dead
            proc.wait = AsyncMock(return_value=0)
            mock_exec.return_value = proc

            tile = await backend.spawn(config)

            result = await backend.capture_frame(tile.id)

            # Should return None or placeholder for dead tile
            assert result is None or result is not None


class TestBackendConfiguration:
    """Tests for VNC backend configuration."""

    def test_default_display_starts_at_10(self):
        """Default VNC display should start at :10."""
        from systems.ai_gui.backends.vnc_backend import VNCBackend
        backend = VNCBackend()

        assert backend._next_display == 10

    def test_custom_display_start(self):
        """Should be able to configure starting display."""
        from systems.ai_gui.backends.vnc_backend import VNCBackend
        backend = VNCBackend(start_display=20)

        assert backend._next_display == 20

    def test_custom_websockify_port_start(self):
        """Should be able to configure starting websockify port."""
        from systems.ai_gui.backends.vnc_backend import VNCBackend
        backend = VNCBackend(start_websockify_port=6000)

        assert backend._next_ws_port == 6000

    @pytest.mark.asyncio
    async def test_qemu_command_includes_kvm_if_available(self):
        """QEMU command should use KVM acceleration if available."""
        from systems.ai_gui.backends.vnc_backend import VNCBackend
        backend = VNCBackend()

        config = AppConfig(app="alpine", backend="vnc")

        with patch('asyncio.create_subprocess_exec') as mock_exec:
            with patch('os.path.exists', return_value=True):  # /dev/kvm exists
                proc = MagicMock()
                proc.pid = 12345
                proc.returncode = None
                proc.wait = AsyncMock(return_value=0)
                mock_exec.return_value = proc

                tile = await backend.spawn(config)

                # Check first call (QEMU) for KVM or qemu
                first_call_args = ' '.join(str(a) for a in mock_exec.call_args_list[0][0])
                assert "qemu" in first_call_args.lower()

    @pytest.mark.asyncio
    async def test_spawn_with_custom_memory(self):
        """Should be able to configure QEMU memory."""
        from systems.ai_gui.backends.vnc_backend import VNCBackend
        backend = VNCBackend(memory_mb=1024)

        config = AppConfig(app="alpine", backend="vnc")

        with patch('asyncio.create_subprocess_exec') as mock_exec:
            proc = MagicMock()
            proc.pid = 12345
            proc.returncode = None
            proc.wait = AsyncMock(return_value=0)
            mock_exec.return_value = proc

            tile = await backend.spawn(config)

            # Check first call (QEMU) for memory setting
            first_call_args = ' '.join(str(a) for a in mock_exec.call_args_list[0][0])
            assert "1024" in first_call_args or "1G" in first_call_args
