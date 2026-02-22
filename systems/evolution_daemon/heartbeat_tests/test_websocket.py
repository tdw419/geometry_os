"""
Heartbeat Test: WebSocket Server

Verifies that WebSocket functionality is available for the visual interface.
This test checks if the websockets library is installed and can create connections.
"""

import pytest


def test_websockets_import():
    """Test that websockets library is available"""
    try:
        import websockets
        assert websockets is not None
    except ImportError:
        pytest.skip("websockets library not installed")


def test_websocket_server_can_start():
    """Test that a basic WebSocket server can be created"""
    try:
        import websockets
        import asyncio
    except ImportError:
        pytest.skip("websockets library not installed")

    started = False
    server = None

    async def handler(websocket):
        """Simple echo handler"""
        async for message in websocket:
            await websocket.send(message)

    async def test_server():
        nonlocal started, server
        try:
            # Try to start server on a random port
            server = await websockets.serve(handler, "localhost", 0)
            started = True
            # Close immediately
            server.close()
            await server.wait_closed()
        except Exception as e:
            pytest.fail(f"Could not start WebSocket server: {e}")

    asyncio.run(test_server())
    assert started is True


def test_websocket_client_can_connect():
    """Test that WebSocket client can attempt connection"""
    try:
        import websockets
        import asyncio
    except ImportError:
        pytest.skip("websockets library not installed")

    async def test_connect():
        try:
            # Try to connect to a non-existent server
            # This should fail, but not crash
            async with websockets.connect("ws://localhost:9999", close_timeout=1) as ws:
                pass
        except (ConnectionRefusedError, OSError):
            # Expected - no server running
            pass
        except Exception as e:
            pytest.fail(f"Unexpected error: {e}")

    asyncio.run(test_connect())


def test_webmcp_client_import():
    """Test that WebMCPClient can be imported from evolution daemon"""
    from systems.evolution_daemon.evolution_daemon import WebMCPClient
    assert WebMCPClient is not None


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
