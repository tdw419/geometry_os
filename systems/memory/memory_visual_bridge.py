#!/usr/bin/env python3
"""
Memory Visual Bridge - Geometry OS
==================================

Bridges the PixiJS Visual Shell to the PostgreSQL Vector Memory Daemon.
Enables real-time semantic memory retrieval via WebSockets.

Port: 8768 (WebSocket)
Backend: /tmp/vector_memory_daemon.sock (Unix Socket)
"""

import asyncio
import json
import os
import socket
import websockets
from websockets.server import serve
import numpy as np
import argparse

class MemoryVisualBridge:
    def __init__(self, memory_socket="/tmp/vector_memory_daemon.sock", ws_port=8768, map_size=4096):
        self.memory_socket = memory_socket
        self.ws_port = ws_port
        self.map_size = map_size
        self.clients = set()

    def _query_memory_daemon(self, message):
        """Send a message to the Vector Memory Daemon and get response"""
        try:
            if not os.path.exists(self.memory_socket):
                return {"error": f"Memory socket not found at {self.memory_socket}"}

            with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as sock:
                sock.connect(self.memory_socket)
                sock.sendall(json.dumps(message).encode('utf-8'))
                
                # Receive response
                response_data = b""
                while True:
                    chunk = sock.recv(4096)
                    if not chunk:
                        break
                    response_data += chunk
                
                if not response_data:
                    return {"error": "Empty response from memory daemon"}
                    
                return json.loads(response_data.decode('utf-8'))
        except Exception as e:
            print(f"❌ Failed to connect to Memory Daemon: {e}")
            return {"error": str(e)}

    async def handle_client(self, websocket):
        """Handle WebSocket client from the browser"""
        self.clients.add(websocket)
        print(f"🔌 Visual shell connected to Memory Bridge")
        try:
            async for message in websocket:
                try:
                    data = json.loads(message)
                except json.JSONDecodeError:
                    continue

                if data.get('type') == 'recall_memories':
                    world_x = data.get('x', 0)
                    world_y = data.get('y', 0)
                    
                    # Convert world to normalized hilbert coordinates (0-1)
                    # We assume the Hilbert space is mapped within 0..map_size
                    norm_x = world_x / self.map_size
                    norm_y = world_y / self.map_size
                    
                    print(f"🔍 Recalling memories around ({world_x:.0f}, {world_y:.0f}) -> norm ({norm_x:.3f}, {norm_y:.3f})")
                    
                    # Use provided embedding or fallback to random (prototype)
                    query_vector = data.get('embedding')
                    if not query_vector:
                        # In production, this would come from the current context's LLM state
                        query_vector = np.random.rand(1536).tolist()
                    
                    memory_msg = {
                        'message_type': 'GetMemoryBeam',
                        'payload': {
                            'query_vector': query_vector,
                            'current_x': norm_x,
                            'current_y': norm_y,
                            'limit': 20
                        }
                    }
                    
                    response = self._query_memory_daemon(memory_msg)
                    
                    if 'beam' in response:
                        # Convert normalized back to world coordinates
                        memories = []
                        for m in response['beam']:
                            memories.append({
                                'x': m['hilbert_x'] * self.map_size,
                                'y': m['hilbert_y'] * self.map_size,
                                'similarity': m['similarity'],
                                'preview': m['token'],
                                'timestamp': m['timestamp']
                            })
                        
                        await websocket.send(json.dumps({
                            'type': 'memory_beam_results',
                            'memories': memories
                        }))
                    else:
                        error = response.get('error', 'Unknown error')
                        print(f"⚠️ Memory Daemon error: {error}")
                        await websocket.send(json.dumps({
                            'type': 'error',
                            'message': f"Memory retrieval failed: {error}"
                        }))
                        
        except websockets.exceptions.ConnectionClosed:
            pass
        except Exception as e:
            print(f"❌ Error handling client: {e}")
        finally:
            if websocket in self.clients:
                self.clients.remove(websocket)
            print("🔌 Visual shell disconnected")

    async def start(self):
        print(f"🚀 Memory Visual Bridge starting...")
        print(f"   WebSocket: ws://localhost:{self.ws_port}")
        print(f"   Memory Daemon: {self.memory_socket}")
        
        async with serve(self.handle_client, "localhost", self.ws_port):
            await asyncio.Future()  # run forever

def parse_args():
    parser = argparse.ArgumentParser(description='Memory Visual Bridge for Geometry OS')
    parser.add_argument('--port', type=int, default=8768, help='WebSocket port')
    parser.add_argument('--socket', default='/tmp/vector_memory_daemon.sock', help='Memory daemon socket')
    parser.add_argument('--map-size', type=int, default=4096, help='Map size for coordinate conversion')
    return parser.parse_args()

if __name__ == "__main__":
    args = parse_args()
    bridge = MemoryVisualBridge(
        memory_socket=args.socket,
        ws_port=args.port,
        map_size=args.map_size
    )
    try:
        asyncio.run(bridge.start())
    except KeyboardInterrupt:
        print("
🛑 Shutting down...")
