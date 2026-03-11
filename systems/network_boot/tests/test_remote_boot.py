"""
Tests for Remote Boot Protocol (Phase 25)

Tests the RemoteBootClient and RemoteBootServer for remote
container boot operations.
"""

from unittest.mock import AsyncMock, Mock

import pytest

from systems.network_boot.remote_boot import (
    RemoteBootClient,
    RemoteBootProgress,
    RemoteBootResult,
    RemoteBootServer,
    RemoteBootStatus,
)


class TestRemoteBootStatus:
    """Tests for RemoteBootStatus enum."""

    def test_status_values(self):
        assert RemoteBootStatus.PREPARING.value == "preparing"
        assert RemoteBootStatus.TRANSFERRING.value == "transferring"
        assert RemoteBootStatus.BOOTING.value == "booting"
        assert RemoteBootStatus.RUNNING.value == "running"
        assert RemoteBootStatus.FAILED.value == "failed"
        assert RemoteBootStatus.CANCELLED.value == "cancelled"


class TestRemoteBootProgress:
    """Tests for RemoteBootProgress dataclass."""

    def test_progress_creation(self):
        progress = RemoteBootProgress(
            status=RemoteBootStatus.PREPARING,
            timestamp=1234567890.0,
            message="Preparing boot...",
        )
        assert progress.status == RemoteBootStatus.PREPARING
        assert progress.message == "Preparing boot..."

    def test_progress_with_error(self):
        progress = RemoteBootProgress(
            status=RemoteBootStatus.FAILED,
            timestamp=1234567890.5,
            error="Connection refused",
        )
        assert progress.error == "Connection refused"

    def test_progress_from_dict(self):
        data = {
            "status": "running",
            "timestamp": 1234567890.0,
            "container_id": "test-container-123",
            "vnc_port": 5901,
            "message": "Container running",
            "percent": 100,
        }
        progress = RemoteBootProgress.from_dict(data)
        assert progress.status == RemoteBootStatus.RUNNING
        assert progress.container_id == "test-container-123"
        assert progress.vnc_port == 5901


class TestRemoteBootResult:
    """Tests for RemoteBootResult dataclass."""

    def test_result_success(self):
        result = RemoteBootResult(
            success=True,
            container_id="test-123",
            vnc_port=5901,
            peer_hostname="node1",
            elapsed_time=1.5,
        )
        assert result.success is True
        assert result.container_id == "test-123"
        assert result.vnc_port == 5901

    def test_result_failure(self):
        result = RemoteBootResult(
            success=False,
            error="Connection timeout",
            elapsed_time=2.0,
        )
        assert result.success is False
        assert result.error == "Connection timeout"

    def test_result_from_dict(self):
        data = {
            "success": True,
            "container_id": "test-container-456",
            "vnc_port": 5902,
            "peer_hostname": "node2",
            "elapsed_time": 1.5,
        }
        result = RemoteBootResult.from_dict(data)
        assert result.success is True
        assert result.container_id == "test-container-456"


class TestRemoteBootClient:
    """Tests for RemoteBootClient."""

    @pytest.fixture
    def client(self):
        return RemoteBootClient("localhost", peer_port=8775)

    def test_client_creation(self, client):
        assert client.peer_hostname == "localhost"
        assert client.peer_port == 8775
        assert client.timeout == 300.0

    def test_cancel_sets_flag(self, client):
        assert client._cancel_requested is False
        client.cancel()
        assert client._cancel_requested is True

    @pytest.mark.asyncio
    async def test_boot_file_not_found(self, client):
        result = await client.boot("/nonexistent/file.rts.png")
        assert result.success is False
        assert "File not found" in result.error

    @pytest.mark.asyncio
    async def test_close_session(self, client):
        # Create session
        session = await client._get_session()
        assert session is not None
        assert not session.closed

        # Close it
        await client.close()
        assert session.closed


class TestRemoteBootServer:
    """Tests for RemoteBootServer."""

    @pytest.fixture
    def boot_manager(self):
        manager = Mock()
        boot_result = Mock()
        boot_result.success = True
        manager.boot = AsyncMock(return_value=boot_result)

        container = Mock()
        container.name = "test-container"
        container.vnc_port = 5901
        manager.get_container = Mock(return_value=container)
        manager.stop = AsyncMock()
        return manager

    @pytest.fixture
    def server(self, boot_manager):
        return RemoteBootServer(boot_manager, port=8775)

    def test_server_creation(self, server):
        assert server.port == 8775
        assert server.boot_manager is not None

    def test_server_initial_state(self, server):
        assert server._active_boots == {}
        assert server._app is None

    @pytest.mark.asyncio
    async def test_stop_without_start(self, server):
        # Should not error when stopping without starting
        await server.stop()


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
