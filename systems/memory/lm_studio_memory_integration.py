#!/usr/bin/env python3
"""
LM Studio Memory Integration
============================

Integrates LM Studio Bridge with the Vector Memory Daemon for storing
thought pixels as they are generated.

This module extends the existing LMStudioBridge to automatically store
each generated token in the PostgreSQL + pgvector database.
"""

import asyncio
import json
import socket
import time
from typing import Dict, List, Optional, Tuple
from pathlib import Path
import numpy as np

# Add project root to path
project_root = Path(__file__).parent.parent.parent
import sys
sys.path.insert(0, str(project_root))

from systems.neural_substrate.lm_studio_bridge import LMStudioBridge
from systems.memory.vector_memory_daemon import ThoughtPixel


class LMStudioMemoryBridge:
    """
    Extended LM Studio Bridge with memory integration.
    Stores each generated token in the Vector Memory Daemon.
    """
    
    def __init__(
        self,
        lm_studio_url: str = "http://localhost:1234/v1",
        memory_socket_path: str = "/tmp/vector_memory_daemon.sock",
        enable_memory: bool = True
    ):
        self.bridge = LMStudioBridge(lm_studio_url=lm_studio_url)
        self.memory_socket_path = memory_socket_path
        self.enable_memory = enable_memory
        self.session_id = self._generate_session_id()
        self.sequence_position = 0
        
        # Performance tracking
        self.tokens_stored = 0
        self.store_failures = 0
    
    def _generate_session_id(self) -> str:
        """Generate a unique session identifier"""
        return f"lm_studio_{int(time.time())}"
    
    async def send_token_with_memory(
        self,
        token: str,
        token_id: int,
        embedding: np.ndarray,
        layer: int = 0,
        activation: float = 1.0
    ) -> bool:
        """
        Send token activation to both compositor and memory daemon.
        
        Args:
            token: The token text
            token_id: The token ID
            embedding: Vector embedding of the token
            layer: Layer index (default: 0)
            activation: Activation level (default: 1.0)
        
        Returns:
            True if successful, False otherwise
        """
        try:
            # Get Hilbert position from bridge
            hilbert_pos = self.bridge.hilbert_position(token_id)
            
            # Send to compositor (existing functionality)
            await self.bridge.send_token_activation(token, token_id, activation, layer)
            
            # Send to memory daemon (new functionality)
            if self.enable_memory:
                success = await self._store_thought(
                    token_id=token_id,
                    token=token,
                    embedding=embedding,
                    hilbert_x=hilbert_pos[0],
                    hilbert_y=hilbert_pos[1],
                    layer=layer,
                    activation=activation
                )
                
                if success:
                    self.tokens_stored += 1
                    if self.tokens_stored % 100 == 0:
                        print(f"📊 Stored {self.tokens_stored} tokens in memory")
                else:
                    self.store_failures += 1
                    print(f"⚠️  Failed to store token: {token}")
            
            self.sequence_position += 1
            return True
            
        except Exception as e:
            print(f"❌ Error sending token with memory: {e}")
            return False
    
    async def _store_thought(
        self,
        token_id: int,
        token: str,
        embedding: np.ndarray,
        hilbert_x: float,
        hilbert_y: float,
        layer: int,
        activation: float
    ) -> bool:
        """
        Store a thought pixel in the memory daemon.
        
        Args:
            token_id: The token ID
            token: The token text
            embedding: Vector embedding
            hilbert_x: Hilbert X coordinate (normalized 0-1)
            hilbert_y: Hilbert Y coordinate (normalized 0-1)
            layer: Layer index
            activation: Activation level
        
        Returns:
            True if successful, False otherwise
        """
        try:
            # Create thought message
            message = {
                'message_type': 'StoreThought',
                'payload': {
                    'token_id': token_id,
                    'token': token,
                    'embedding': embedding.tolist(),
                    'hilbert_x': hilbert_x,
                    'hilbert_y': hilbert_y,
                    'layer': layer,
                    'activation': activation,
                    'session_id': self.session_id,
                    'timestamp': time.time()
                }
            }
            
            # Send to memory daemon
            sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
            sock.connect(self.memory_socket_path)
            sock.send(json.dumps(message).encode('utf-8'))
            
            # Receive response
            response_data = sock.recv(4096)
            response = json.loads(response_data.decode('utf-8'))
            
            sock.close()
            
            return response.get('success', False)
            
        except Exception as e:
            print(f"❌ Error storing thought: {e}")
            return False
    
    async def recall_memories(
        self,
        query_vector: np.ndarray,
        limit: int = 100,
        threshold: float = 0.0
    ) -> List[Dict]:
        """
        Recall semantically related memories.
        
        Args:
            query_vector: Query embedding vector
            limit: Maximum number of results
            threshold: Minimum similarity threshold
        
        Returns:
            List of memory dictionaries
        """
        try:
            message = {
                'message_type': 'RecallMemories',
                'payload': {
                    'query_vector': query_vector.tolist(),
                    'limit': limit,
                    'threshold': threshold,
                    'exclude_session': self.session_id  # Exclude current session
                }
            }
            
            # Send to memory daemon
            sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
            sock.connect(self.memory_socket_path)
            sock.send(json.dumps(message).encode('utf-8'))
            
            # Receive response
            response_data = sock.recv(65536)
            response = json.loads(response_data.decode('utf-8'))
            
            sock.close()
            
            return response.get('memories', [])
            
        except Exception as e:
            print(f"❌ Error recalling memories: {e}")
            return []
    
    async def get_memory_beam(
        self,
        query_vector: np.ndarray,
        current_x: float,
        current_y: float,
        limit: int = 20
    ) -> List[Dict]:
        """
        Get memory beam for visualization.
        
        Args:
            query_vector: Query embedding vector
            current_x: Current cursor X position (normalized 0-1)
            current_y: Current cursor Y position (normalized 0-1)
            limit: Maximum number of results
        
        Returns:
            List of memory dictionaries with spatial distances
        """
        try:
            message = {
                'message_type': 'GetMemoryBeam',
                'payload': {
                    'query_vector': query_vector.tolist(),
                    'current_x': current_x,
                    'current_y': current_y,
                    'limit': limit
                }
            }
            
            # Send to memory daemon
            sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
            sock.connect(self.memory_socket_path)
            sock.send(json.dumps(message).encode('utf-8'))
            
            # Receive response
            response_data = sock.recv(65536)
            response = json.loads(response_data.decode('utf-8'))
            
            sock.close()
            
            return response.get('beam', [])
            
        except Exception as e:
            print(f"❌ Error getting memory beam: {e}")
            return []
    
    async def get_stats(self) -> Dict:
        """Get memory statistics"""
        try:
            message = {
                'message_type': 'GetStats',
                'payload': {}
            }
            
            # Send to memory daemon
            sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
            sock.connect(self.memory_socket_path)
            sock.send(json.dumps(message).encode('utf-8'))
            
            # Receive response
            response_data = sock.recv(4096)
            response = json.loads(response_data.decode('utf-8'))
            
            sock.close()
            
            return response.get('stats', {})
            
        except Exception as e:
            print(f"❌ Error getting stats: {e}")
            return {}
    
    async def stream_with_memory(
        self,
        prompt: str,
        embedding_generator: callable,
        max_tokens: int = 100
    ) -> List[str]:
        """
        Stream tokens from LM Studio with automatic memory storage.
        
        Args:
            prompt: The input prompt
            embedding_generator: Function to generate embeddings for tokens
            max_tokens: Maximum number of tokens to generate
        
        Returns:
            List of generated tokens
        """
        print(f"🎭 Streaming tokens with memory storage for: '{prompt}'")
        
        tokens = []
        
        # Simulate token generation (replace with actual LM Studio integration)
        mock_tokens = [
            ("The", 1234),
            (" quick", 5678),
            (" brown", 9012),
            (" fox", 3456),
            (" jumps", 7890),
            (" over", 2345),
            (" the", 6789),
            (" lazy", 123),
            (" dog", 4567),
            (".", 8901)
        ]
        
        for i, (token, token_id) in enumerate(mock_tokens[:max_tokens]):
            # Generate embedding for token
            embedding = embedding_generator(token)
            
            # Send token with memory
            await self.send_token_with_memory(
                token=token,
                token_id=token_id,
                embedding=embedding,
                layer=0,
                activation=1.0 - (i * 0.05)  # Decay activation
            )
            
            tokens.append(token)
            
            # Small delay to simulate streaming
            await asyncio.sleep(0.1)
        
        print(f"✅ Streamed {len(tokens)} tokens with memory storage")
        return tokens


def mock_embedding_generator(token: str) -> np.ndarray:
    """
    Mock embedding generator for testing.
    In production, replace with actual embedding model.
    """
    # Simple hash-based embedding (not semantically meaningful)
    import hashlib
    hash_obj = hashlib.md5(token.encode())
    hash_bytes = hash_obj.digest()
    
    # Convert to 1536-dimensional vector
    embedding = np.zeros(1536)
    for i, byte in enumerate(hash_bytes):
        embedding[i] = byte / 255.0
    
    # Fill remaining dimensions with random values
    for i in range(len(hash_bytes), 1536):
        embedding[i] = np.random.rand()
    
    return embedding


async def demo():
    """Demo the LM Studio Memory Bridge"""
    print("🚀 LM Studio Memory Bridge Demo")
    print("=" * 60)
    
    # Create bridge
    bridge = LMStudioMemoryBridge(
        lm_studio_url="http://localhost:1234/v1",
        memory_socket_path="/tmp/vector_memory_daemon.sock",
        enable_memory=True
    )
    
    print(f"✅ Session ID: {bridge.session_id}")
    print()
    
    # Stream tokens with memory
    tokens = await bridge.stream_with_memory(
        prompt="The quick brown fox",
        embedding_generator=mock_embedding_generator,
        max_tokens=10
    )
    
    print()
    print(f"✅ Generated tokens: {''.join(tokens)}")
    print(f"✅ Tokens stored: {bridge.tokens_stored}")
    print(f"✅ Store failures: {bridge.store_failures}")
    print()
    
    # Recall memories
    print("📝 Recalling semantically related memories...")
    query_vector = mock_embedding_generator("fox")
    memories = await bridge.recall_memories(
        query_vector=query_vector,
        limit=5,
        threshold=0.0
    )
    
    print(f"✅ Retrieved {len(memories)} memories:")
    for memory in memories:
        print(f"   - {memory['token']} (similarity: {memory['similarity']:.3f})")
    
    print()
    
    # Get memory beam
    print("📝 Getting memory beam for visualization...")
    beam = await bridge.get_memory_beam(
        query_vector=query_vector,
        current_x=0.5,
        current_y=0.5,
        limit=5
    )
    
    print(f"✅ Memory beam with {len(beam)} memories:")
    for memory in beam:
        print(f"   - {memory['token']} at ({memory['hilbert_x']:.2f}, {memory['hilbert_y']:.2f}) "
              f"similarity: {memory['similarity']:.3f}, "
              f"spatial_distance: {memory['spatial_distance']:.3f}")
    
    print()
    
    # Get stats
    print("📝 Getting memory statistics...")
    stats = await bridge.get_stats()
    
    print(f"✅ Session stats:")
    print(f"   - Total thoughts: {stats.get('session_stats', {}).get('total_thoughts', 0)}")
    print(f"   - Store count: {stats.get('store_count', 0)}")
    print(f"   - Retrieve count: {stats.get('retrieve_count', 0)}")
    print(f"   - Avg retrieval time: {stats.get('avg_retrieval_time', 0)*1000:.2f}ms")
    
    print()
    print("=" * 60)
    print("🎉 Demo complete!")


if __name__ == '__main__':
    asyncio.run(demo())
