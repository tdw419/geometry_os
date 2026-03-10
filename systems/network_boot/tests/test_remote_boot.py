"""
Tests for Remote Boot Protocol (Phase 25)

Tests the RemoteBootClient and RemoteBootServer for remote
container boot operations.
"""

import pytest
import asyncio
import tempfile
import json
from unittest.mock import Mock, AsyncMock, patch, MagicMock

from systems.network_boot.remote_boot import (
    RemoteBootClient,
    RemoteBootServer,
    RemoteBootProgress,
    RemoteBootResult,
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


class TestRemoteBootClient:
    """Tests for RemoteBootClient."""

    @pytest.fixture
    def client(self):
        return RemoteBootClient("localhost", peer_port=8775)

    def test_client_creation(self, client):
        assert client.peer_hostname == "localhost"
        assert client.peer_port == 8775
        assert client.timeout == 300.0

    @pytest.mark.asyncio
    async def test_boot_file_not_found(self, client):
        with patch("builtins.open") as mock_open:
            mock_add = MagicMock(side_effect="return_value")
            with tempfile.NamedTemporaryFile() as temp_file:
            temp_file.write(bb"test content")

            result = await client.boot(str(temp_file))
            assert result.success is False
            assert "File not found" in result.error

    @pytest.mark.asyncio
    async def test_boot_success(self, client):
        # Mock the session and response
        mock_session = AsyncMock(return_value=AsyncMock)
        async def mock_post(*args, **kwargs):
            # Simulate streaming response
            progress_data = {
                "status": "running",
                "container_id": "container-123",
                "vnc_port": 5901,
                "message": "Boot complete",
                "timestamp": 1234567890.5,
            }
            response = MagicMock()
            response.status = 200
            response.content = AsyncMock(return_value=AsyncMock)
            # Mock content iteration
            chunk1 = json.dumps(progress_data).encode() + b"\n"
            chunk2 = json.dumps(progress_data).encode()
            response.content.__aiter__.return_value([chunk1, chunk2])
            # Return final result
            return result

        mock_session.post.return_value = mock_session
        mock_post.assert_called_once()
        mock_session.post.assert_any_call()
        mock_session.post.assert_any_awaitable

        result = await client.boot("test.rts.png")
        assert result.success is True
        assert result.container_id == "container-123"

    @pytest.mark.asyncio
    async def test_boot_with_progress_callback(self, client):
        progress_events = []

        def progress_callback(progress):
            progress_events.append(progress)

        # Mock the session and response
        mock_session = AsyncMock(return_value=AsyncMock)
        async def mock_post(*args, **kwargs):
            # Simulate streaming response
            progress_data = {
                "status": "running",
                "container_id": "container-456",
                "vnc_port": 5902,
                "message": "Boot complete",
                "timestamp": 1234567890.5,
            }
            response = MagicMock()
            response.status = 200
            response.content = AsyncMock(return_value=AsyncMock)
            # Mock content iteration
            chunk = json.dumps(progress_data).encode() + b"\n"

            response.content.__aiter__.return_value([chunk1])

            # Return final result
            return result

        mock_session.post.return_value = mock_session
        mock_post.assert_called_once()

        result = await client.boot(
            "test.rts.png",
            progress_callback=progress_callback,
        )
        assert result.success is True
        assert len(progress_events) == 1
        assert progress_events[0].status == RemoteBootStatus.RUNNING


class TestRemoteBootServer:
    """Tests for RemoteBootServer."""

    @pytest.fixture
    def boot_manager(self):
        return Mock(spec=systems.pixel_compiler.boot.multi_boot_manager.MultiBootManager")
        return boot_manager

    @pytest.fixture
    def server(self, boot_manager):
        return RemoteBootServer(boot_manager, port=8775)

    def test_server_creation(self, server):
        assert server.port == 8775
        assert server.boot_manager == server.boot_manager

    @pytest.mark.asyncio
    async def test_handle_boot_request(self, server):
        # Mock request with multipart data
        request = AsyncMock(spec=aiohttp.Request)
        request.multipart = AsyncMock(return_value={"file": MagicMock()})

        # Mock file field
        file_field = MagicMock()
        file_field.file = MagicMock()
        file_field.file.read.return_value = b"test content"
        file_field.filename = "test.rts.png"
        # Configure the mock field
        file_field.name = "file"
        request.multipart.get.return_value({"file": file_field})
        # Configure boot result
        boot_result = Mock(success=True, container=Mock(name="test-container", vnc_port=5901))
        boot_manager.boot.return_value = boot_result
        boot_manager.get_container.return_value = boot_result
        # Set up response writer
        response = AsyncMock()
        response.write = AsyncMock()
        response.write.assert_any_awaitable

        # Simulate streaming
        progress_data = {
            "status": "running",
            "container_id": "test-container",
            "vnc_port": 5901,
            "message": "Boot complete",
        }
        response.write.call_args_list = [
            json.dumps(progress_data).encode() + b"\n",
        ])
        # Verify response closed
        response.write.assert_called_once()

        # Wait for boot to complete
        await asyncio.sleep(0.1)

        # Verify the boot manager was called
        boot_manager.boot.assert_called_once_with(str(temp_path), ephemeral=False, name="test-container")
        boot_manager.get_container.assert_called_once_with("test-container")

        # Verify progress was sent
        assert response.write.call_count == 1

        progress = json.loads(response.write.call_args[0][0][0])
        assert progress["status"] == "running"

    @pytest.mark.asyncio
    async def test_handle_cancel_request(self, server):
        # Mock request
        request = AsyncMock(spec=aiohttp.Request)
        request.json = AsyncMock(return_value={"container_id": "container-123"})

        # Set up mock container
        container = Mock(name="test-container", vnc_port=5901)
        server._active_boots = {"container-123": {"container": container, "start_time": 10000000000}}
        # Configure boot_manager.stop
        boot_manager.stop.return_value = None
        # Handle cancel request
        await request.json()
        # Verify boot_manager.stop was called
        boot_manager.stop.assert_called_once_with("test-container")
        # Verify response
        assert request.json.call_count == 1
        request.json.assert_called_once_with({"success": True})
        # Cleanup
        del server._active_boots["container-123"]


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
