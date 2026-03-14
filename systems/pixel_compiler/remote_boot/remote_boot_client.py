"""
Remote Boot Client

Initiates boot requests to remote peers and streams progress back.
"""

import json
import logging
import time
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Any

import aiohttp

logger = logging.getLogger("RemoteBootClient")


class RemoteBootStatus(Enum):
    """Status of remote boot operation."""
    PENDING = "pending"
    TRANSFERRING = "transferring"
    BOOTING = "booting"
    RUNNING = "running"
    FAILED = "failed"
    CANCELLED = "cancelled"


@dataclass
class RemoteBootProgress:
    """Progress update from remote boot."""
    status: RemoteBootStatus
    message: str
    percent: float = 0.0
    vnc_port: int | None = None
    container_id: str | None = None
    error: str | None = None
    timestamp: float = field(default_factory=time.time)

    def to_dict(self) -> dict[str, Any]:
        return {
            "status": self.status.value,
            "message": self.message,
            "percent": self.percent,
            "vnc_port": self.vnc_port,
            "container_id": self.container_id,
            "error": self.error,
            "timestamp": self.timestamp,
        }

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> "RemoteBootProgress":
        return cls(
            status=RemoteBootStatus(data["status"]),
            message=data["message"],
            percent=data.get("percent", 0.0),
            vnc_port=data.get("vnc_port"),
            container_id=data.get("container_id"),
            error=data.get("error"),
            timestamp=data.get("timestamp", time.time()),
        )


@dataclass
class RemoteBootResult:
    """Final result of remote boot."""
    success: bool
    container_id: str | None = None
    vnc_port: int | None = None
    peer_hostname: str | None = None
    error: str | None = None
    elapsed_time: float = 0.0


class RemoteBootClient:
    """
    Client for initiating remote boot operations.

    Usage:
        client = RemoteBootClient(peer_hostname="node2.local")
        result = await client.boot("alpine.rts.png", progress_callback=my_callback)
    """

    def __init__(
        self,
        peer_hostname: str,
        peer_port: int = 8774,
        timeout: float = 300.0,
    ):
        """
        Initialize remote boot client.

        Args:
            peer_hostname: Target peer hostname or IP
            peer_port: Remote boot server port (default 8774)
            timeout: Maximum time to wait for boot completion
        """
        self.peer_hostname = peer_hostname
        self.peer_port = peer_port
        self.timeout = timeout
        self._session: aiohttp.ClientSession | None = None
        self._cancel_requested = False

    async def _get_session(self) -> aiohttp.ClientSession:
        """Get or create HTTP session."""
        if self._session is None or self._session.closed:
            self._session = aiohttp.ClientSession(timeout=aiohttp.ClientTimeout(total=self.timeout))
        return self._session

    async def close(self):
        """Close HTTP session."""
        if self._session and not self._session.closed:
            await self._session.close()

    async def boot(
        self,
        rts_file: str,
        progress_callback: Callable[[RemoteBootProgress], None] | None = None,
        ephemeral: bool = False,
        name: str | None = None,
    ) -> RemoteBootResult:
        """
        Boot a container on the remote peer.

        Args:
            rts_file: Path to .rts.png file to boot
            progress_callback: Optional callback for progress updates
            ephemeral: Boot in ephemeral mode (changes discarded)
            name: Optional container name

        Returns:
            RemoteBootResult with success status and container info
        """
        start_time = time.time()
        self._cancel_requested = False

        # Read file content
        rts_path = Path(rts_file)
        if not rts_path.exists():
            return RemoteBootResult(
                success=False,
                error=f"File not found: {rts_file}",
            )

        file_size = rts_path.stat().st_size
        file_name = rts_path.name

        logger.info(f"Starting remote boot of {file_name} ({file_size} bytes) to {self.peer_hostname}")

        try:
            session = await self._get_session()
            url = f"http://{self.peer_hostname}:{self.peer_port}/boot"

            # Prepare multipart upload
            with open(rts_path, "rb") as f:
                form = aiohttp.FormData()
                form.add_field("file", f, filename=file_name, content_type="image/png")
                form.add_field("ephemeral", str(ephemeral).lower())
                if name:
                    form.add_field("name", name)

                # Stream response for progress updates
                async with session.post(url, data=form) as response:
                    if response.status != 200:
                        error = await response.text()
                        return RemoteBootResult(
                            success=False,
                            error=f"Remote boot failed: {error}",
                            elapsed_time=time.time() - start_time,
                        )

                    # Read streaming response
                    buffer = ""
                    async for chunk in response.content:
                        if self._cancel_requested:
                            await self._cancel_boot()
                            return RemoteBootResult(
                                success=False,
                                error="Boot cancelled by user",
                                elapsed_time=time.time() - start_time,
                            )

                        buffer += chunk.decode("utf-8")

                        # Process complete JSON messages
                        while "\n" in buffer:
                            line, buffer = buffer.split("\n", 1)
                            if line.strip():
                                try:
                                    data = json.loads(line)
                                    progress = RemoteBootProgress.from_dict(data)

                                    if progress_callback:
                                        progress_callback(progress)

                                    if progress.status == RemoteBootStatus.RUNNING:
                                        return RemoteBootResult(
                                            success=True,
                                            container_id=progress.container_id,
                                            vnc_port=progress.vnc_port,
                                            peer_hostname=self.peer_hostname,
                                            elapsed_time=time.time() - start_time,
                                        )

                                    if progress.status == RemoteBootStatus.FAILED:
                                        return RemoteBootResult(
                                            success=False,
                                            error=progress.error or "Remote boot failed",
                                            elapsed_time=time.time() - start_time,
                                        )

                                except json.JSONDecodeError:
                                    logger.warning(f"Invalid JSON in progress: {line}")

            # If we get here, stream ended without completion
            return RemoteBootResult(
                success=False,
                error="Remote boot stream ended without completion",
                elapsed_time=time.time() - start_time,
            )

        except TimeoutError:
            return RemoteBootResult(
                success=False,
                error=f"Remote boot timed out after {self.timeout}s",
                elapsed_time=time.time() - start_time,
            )
        except aiohttp.ClientError as e:
            return RemoteBootResult(
                success=False,
                error=f"Connection error: {e}",
                elapsed_time=time.time() - start_time,
            )
        except Exception as e:
            logger.exception("Remote boot error")
            return RemoteBootResult(
                success=False,
                error=f"Unexpected error: {e}",
                elapsed_time=time.time() - start_time,
            )

    async def _cancel_boot(self):
        """Send cancel request to remote peer."""
        try:
            session = await self._get_session()
            url = f"http://{self.peer_hostname}:{self.peer_port}/cancel"
            async with session.post(url) as response:
                logger.info(f"Cancel request sent: {response.status}")
        except Exception as e:
            logger.warning(f"Failed to send cancel request: {e}")

    def cancel(self):
        """Request cancellation of ongoing boot."""
        self._cancel_requested = True

    async def status(self, container_id: str) -> dict[str, Any] | None:
        """
        Get status of a remote container.

        Args:
            container_id: Container ID to check

        Returns:
            Container status dict or None if not found
        """
        try:
            session = await self._get_session()
            url = f"http://{self.peer_hostname}:{self.peer_port}/status/{container_id}"
            async with session.get(url) as response:
                if response.status == 200:
                    return await response.json()
                return None
        except Exception as e:
            logger.warning(f"Status check failed: {e}")
            return None

    async def stop(self, container_id: str) -> bool:
        """
        Stop a remote container.

        Args:
            container_id: Container ID to stop

        Returns:
            True if stopped successfully
        """
        try:
            session = await self._get_session()
            url = f"http://{self.peer_hostname}:{self.peer_port}/stop/{container_id}"
            async with session.post(url) as response:
                return response.status == 200
        except Exception as e:
            logger.warning(f"Stop failed: {e}")
            return False
