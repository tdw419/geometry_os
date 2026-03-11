"""
Evolution Daemon - WebMCP Client

Client for interacting with the PixiJS visual shell via WebMCP bridge.

This connects to the WebSocket server that the frontend also connects to,
allowing the Evolution Daemon to:
- Read current visual state
- Place tiles/UI elements
- Inspect running VM frames
- Verify visual outcomes of code changes
"""

import asyncio
import json
import logging

logger = logging.getLogger("evolution_daemon.webmcp")

# WebSocket support for visual interface
try:
    import websockets
    HAS_WEBSOCKETS = True
except ImportError:
    HAS_WEBSOCKETS = False
    websockets = None


class WebMCPClient:
    """
    Client for interacting with the PixiJS visual shell via WebMCP bridge.

    This connects to the WebSocket server that the frontend also connects to,
    allowing the Evolution Daemon to:
    - Read current visual state
    - Place tiles/UI elements
    - Inspect running VM frames
    - Verify visual outcomes of code changes
    """

    def __init__(self, ws_url: str = "ws://localhost:8768"):
        self.ws_url = ws_url
        self.ws = None
        self.connected = False
        self.message_id = 0
        self.pending_responses: dict[int, asyncio.Future] = {}

    async def connect(self) -> bool:
        """Connect to the visual shell WebSocket"""
        if not HAS_WEBSOCKETS:
            logger.warning("websockets not installed - visual interface disabled")
            return False

        try:
            self.ws = await websockets.connect(self.ws_url)
            self.connected = True
            logger.info(f"✅ Connected to visual shell at {self.ws_url}")

            # Start message handler
            asyncio.create_task(self._message_handler())
            return True
        except Exception as e:
            logger.warning(f"Could not connect to visual shell: {e}")
            self.connected = False
            return False

    async def _message_handler(self):
        """Handle incoming WebSocket messages"""
        try:
            async for message in self.ws:
                data = json.loads(message)
                msg_id = data.get("id")

                if msg_id and msg_id in self.pending_responses:
                    self.pending_responses[msg_id].set_result(data)
        except Exception as e:
            logger.error(f"WebSocket error: {e}")
            self.connected = False

    async def _call(self, method: str, params: dict = None) -> dict:
        """Make a JSON-RPC call to the visual shell"""
        if not self.connected:
            return {"error": "Not connected to visual shell"}

        self.message_id += 1
        msg_id = self.message_id

        future = asyncio.get_event_loop().create_future()
        self.pending_responses[msg_id] = future

        message = {
            "jsonrpc": "2.0",
            "id": msg_id,
            "method": method,
            "params": params or {}
        }

        try:
            await self.ws.send(json.dumps(message))

            # Wait for response with timeout
            result = await asyncio.wait_for(future, timeout=10.0)
            return result.get("result", result)
        except TimeoutError:
            return {"error": "Request timeout"}
        except Exception as e:
            return {"error": str(e)}
        finally:
            self.pending_responses.pop(msg_id, None)

    async def get_os_state(self) -> dict:
        """Get current OS state from the visual map"""
        return await self._call("get_os_state")

    async def get_map_bounds(self) -> dict:
        """Get the bounds of the visual map"""
        return await self._call("get_map_bounds")

    async def place_tile(self, x: int, y: int, tile_type: str, data: dict = None) -> dict:
        """Place a tile on the visual map"""
        return await self._call("builder_place_tile", {
            "x": x,
            "y": y,
            "type": tile_type,
            "data": data or {}
        })

    async def place_text(self, x: int, y: int, text: str, color: str = "#ffffff") -> dict:
        """Place text on the visual map"""
        return await self._call("place_text", {
            "x": x,
            "y": y,
            "text": text,
            "color": color
        })

    async def get_hypervisor_frame(self, vm_id: str = None) -> dict:
        """Get a frame from the hypervisor (running VM)"""
        return await self._call("hypervisor_frame", {"vm_id": vm_id})

    async def inspect_region(self, x: int, y: int, width: int, height: int) -> dict:
        """Inspect a region of the visual map"""
        return await self._call("visual_inspect", {
            "x": x,
            "y": y,
            "width": width,
            "height": height
        })

    async def execute_visual_action(self, action: str, params: dict) -> dict:
        """Execute a visual action on the frontend"""
        return await self._call("execute_action", {
            "action": action,
            "params": params
        })

    async def broadcast_event(self, event_type: str, data: dict) -> bool:
        """
        Broadcast an asynchronous event to the visual shell.
        Unlike _call, this does not wait for a response.
        """
        if not self.connected:
            return False

        message = {
            "jsonrpc": "2.0",
            "method": "broadcast_event",
            "params": {
                "type": event_type,
                "data": data
            }
        }

        try:
            await self.ws.send(json.dumps(message))
            return True
        except Exception as e:
            logger.error(f"Failed to broadcast event {event_type}: {e}")
            return False

    async def render_visual_layout(self, detail_level: str = "standard", region: dict = None) -> dict:
        """Render the current visual state as an ASCII layout"""
        return await self._call("render_visual_layout", {
            "detail_level": detail_level,
            "region": region
        })

    async def get_visual_state(self) -> dict:
        """Get the full visual state including children elements"""
        return await self._call("get_visual_state")

    async def close(self):
        """Close the WebSocket connection"""
        if self.ws:
            await self.ws.close()
            self.connected = False
