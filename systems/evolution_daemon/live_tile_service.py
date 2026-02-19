"""
Live Tile Service - Manages live VM instances for Neural City tiles.

This service coordinates with boot_bridge to start/stop QEMU instances
for "inhabited" buildings in the Neural City visualization.

Task 6 of Live Tile Integration Plan.
"""
import asyncio
import logging
from dataclasses import dataclass, field
from typing import Dict, Optional, Any
from pathlib import Path

logger = logging.getLogger("evolution_daemon.live_tile")


@dataclass
class LiveTileInstance:
    """Represents a running VM tile instance."""
    tile_id: str
    rts_path: str
    status: str = "stopped"  # stopped, booting, running, error
    process: Optional[asyncio.subprocess.Process] = None
    framebuffer: Optional[bytes] = None
    framebuffer_width: int = 320
    framebuffer_height: int = 240
    metrics: Dict[str, Any] = field(default_factory=lambda: {
        "cpu": 0,
        "memory": 0,
        "uptime": 0
    })
    console_output: list = field(default_factory=list)
    boot_time: Optional[float] = None

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for JSON serialization."""
        return {
            "tile_id": self.tile_id,
            "rts_path": self.rts_path,
            "status": self.status,
            "metrics": self.metrics,
            "framebuffer_width": self.framebuffer_width,
            "framebuffer_height": self.framebuffer_height,
            "console_lines": len(self.console_output)
        }


class LiveTileService:
    """
    Service for managing live tile instances.
    Coordinates with boot_bridge for actual VM management.
    """

    def __init__(self):
        self.tiles: Dict[str, LiveTileInstance] = {}
        self._webmcp = None
        self._boot_callback = None

    def set_webmcp(self, webmcp):
        """Set WebMCP instance for broadcasting events."""
        self._webmcp = webmcp
        logger.info("LiveTileService: WebMCP bridge connected")

    def set_boot_callback(self, callback):
        """Set callback for actual boot operations."""
        self._boot_callback = callback

    async def boot_tile(self, tile_id: str, rts_path: str) -> Dict[str, Any]:
        """
        Boot a tile from an RTS file.

        Args:
            tile_id: Unique identifier for the tile
            rts_path: Path to the .rts.png file

        Returns:
            Dict with tile_id and status
        """
        logger.info(f"🚀 Booting tile {tile_id} from {rts_path}")

        # Check if tile already exists
        if tile_id in self.tiles:
            existing = self.tiles[tile_id]
            if existing.status in ["booting", "running"]:
                return {"tile_id": tile_id, "status": "already_running"}

        # Create tile instance
        tile = LiveTileInstance(
            tile_id=tile_id,
            rts_path=rts_path,
            status="booting"
        )
        self.tiles[tile_id] = tile

        # Start boot process (async)
        asyncio.create_task(self._boot_process(tile_id, rts_path))

        # Broadcast boot event
        await self._broadcast_event("tile_booted", {
            "tile_id": tile_id,
            "rts_path": rts_path,
            "status": "booting"
        })

        return {"tile_id": tile_id, "status": "booting"}

    async def _boot_process(self, tile_id: str, rts_path: str):
        """
        Execute the boot process for a tile.
        In production, this would call boot_bridge to start QEMU.
        """
        import time

        tile = self.tiles.get(tile_id)
        if not tile:
            return

        try:
            # Simulate boot time (replace with actual QEMU boot)
            logger.debug(f"Tile {tile_id}: Starting boot sequence...")
            await asyncio.sleep(2)  # Simulate boot

            # Check if tile still exists (not stopped during boot)
            if tile_id not in self.tiles:
                return

            tile.status = "running"
            tile.boot_time = time.time()
            tile.console_output.append({
                "time": self._get_timestamp(),
                "text": "Alpine Linux booted successfully"
            })
            tile.console_output.append({
                "time": self._get_timestamp(),
                "text": "Login: root"
            })

            logger.info(f"✅ Tile {tile_id}: Boot complete")

            # Broadcast running event
            await self._broadcast_event("tile_booted", {
                "tile_id": tile_id,
                "status": "running"
            })

            # Start metrics update loop
            asyncio.create_task(self._metrics_loop(tile_id))

        except Exception as e:
            logger.error(f"❌ Tile {tile_id}: Boot failed - {e}")
            tile.status = "error"
            await self._broadcast_event("tile_error", {
                "tile_id": tile_id,
                "error": str(e)
            })

    async def _metrics_loop(self, tile_id: str):
        """Periodically update tile metrics."""
        import time

        while tile_id in self.tiles:
            tile = self.tiles[tile_id]
            if tile.status != "running":
                break

            # Calculate uptime
            if tile.boot_time:
                tile.metrics["uptime"] = int(time.time() - tile.boot_time)

            # Simulate CPU/memory metrics (replace with actual QEMU stats)
            tile.metrics["cpu"] = 10 + (time.time() % 30)  # 10-40% CPU
            tile.metrics["memory"] = 100 + (time.time() % 50)  # 100-150 MB

            # Broadcast metrics update
            await self._broadcast_event("tile_metrics", {
                "tile_id": tile_id,
                "metrics": tile.metrics
            })

            await asyncio.sleep(5)  # Update every 5 seconds

    async def stop_tile(self, tile_id: str) -> Dict[str, Any]:
        """Stop a running tile."""
        logger.info(f"🛑 Stopping tile {tile_id}")

        tile = self.tiles.get(tile_id)
        if not tile:
            return {"tile_id": tile_id, "status": "not_found"}

        tile.status = "stopped"
        tile.console_output.append({
            "time": self._get_timestamp(),
            "text": "System halted"
        })

        # In production, would terminate QEMU process here
        if tile.process:
            try:
                tile.process.terminate()
                await tile.process.wait()
            except Exception as e:
                logger.warning(f"Error stopping tile process: {e}")

        # Broadcast stop event
        await self._broadcast_event("tile_stopped", {
            "tile_id": tile_id
        })

        return {"tile_id": tile_id, "status": "stopped"}

    async def get_framebuffer(self, tile_id: str) -> Optional[Dict[str, Any]]:
        """Get framebuffer data for a tile."""
        tile = self.tiles.get(tile_id)
        if not tile or not tile.framebuffer:
            return None

        return {
            "tile_id": tile_id,
            "width": tile.framebuffer_width,
            "height": tile.framebuffer_height,
            "data": tile.framebuffer
        }

    async def get_tile_info(self, tile_id: str) -> Optional[Dict[str, Any]]:
        """Get information about a tile."""
        tile = self.tiles.get(tile_id)
        return tile.to_dict() if tile else None

    async def list_tiles(self) -> list:
        """List all tiles."""
        return [tile.to_dict() for tile in self.tiles.values()]

    async def send_console_input(self, tile_id: str, input_text: str) -> Dict[str, Any]:
        """Send input to tile console."""
        tile = self.tiles.get(tile_id)
        if not tile:
            return {"tile_id": tile_id, "status": "not_found"}

        if tile.status != "running":
            return {"tile_id": tile_id, "status": "not_running"}

        # Log the input
        tile.console_output.append({
            "time": self._get_timestamp(),
            "text": f"> {input_text}"
        })

        # In production, would send to QEMU serial console
        logger.debug(f"Tile {tile_id}: Console input: {input_text}")

        return {"tile_id": tile_id, "status": "sent"}

    async def handle_rpc(self, method: str, params: Dict) -> Any:
        """Handle RPC method calls."""
        if method == "boot_tile":
            return await self.boot_tile(
                params.get("tile_id"),
                params.get("rts_path")
            )
        elif method == "stop_tile":
            return await self.stop_tile(params.get("tile_id"))
        elif method == "get_tile_info":
            return await self.get_tile_info(params.get("tile_id"))
        elif method == "list_tiles":
            return await self.list_tiles()
        elif method == "send_console_input":
            return await self.send_console_input(
                params.get("tile_id"),
                params.get("input", "")
            )
        else:
            raise ValueError(f"Unknown method: {method}")

    async def _broadcast_event(self, event_type: str, data: Dict[str, Any]):
        """Broadcast event via WebMCP."""
        if self._webmcp:
            try:
                await self._webmcp.broadcast_event(event_type, data)
            except Exception as e:
                logger.warning(f"Failed to broadcast event: {e}")
        else:
            logger.debug(f"Event (no WebMCP): {event_type} -> {data}")

    def _get_timestamp(self) -> str:
        """Get current timestamp in HH:MM:SS format."""
        from datetime import datetime
        return datetime.now().strftime("%H:%M:%S")


# Module-level service instance for convenience
_service: Optional[LiveTileService] = None


def get_live_tile_service() -> LiveTileService:
    """Get the global LiveTileService instance."""
    global _service
    if _service is None:
        _service = LiveTileService()
    return _service
