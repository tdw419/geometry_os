"""
Synaptic Query Engine for Neural City.

Provides semantic search over the memory space by:
1. Embedding queries to 1536-dim vectors
2. Mapping embeddings to Hilbert coordinates via memory daemon
3. Returning ranked search results

Usage:
    engine = SynapticQueryEngine()
    results = engine.query("neural network architecture", limit=10)
    for r in results:
        print(f"({r['x']}, {r['y']}): {r['token']} (sim={r['similarity']})")
"""

import numpy as np
import json
import socket
import os
import hashlib
from typing import List, Dict, Optional


class SynapticQueryEngine:
    """
    Semantic query engine that interfaces with the memory daemon
    to search for memories by embedding similarity.
    """

    def __init__(
        self,
        memory_socket: str = "/tmp/vector_memory_daemon.sock",
        embedding_model: str = "mock",
        map_size: int = 16384
    ):
        """
        Initialize the synaptic query engine.

        Args:
            memory_socket: Path to the memory daemon Unix socket
            embedding_model: Embedding model to use (currently only 'mock')
            map_size: Size of the Hilbert space map (default 16384x16384)
        """
        self.memory_socket = memory_socket
        self.embedding_model = embedding_model
        self.map_size = map_size

    def embed_query(self, query: str) -> np.ndarray:
        """
        Embed a text query to a 1536-dimensional vector.

        Uses a mock hashing approach for now. In production, this would
        call an embedding API (e.g., OpenAI text-embedding-ada-002).

        Args:
            query: The text query to embed

        Returns:
            Normalized 1536-dim numpy array (float32)
        """
        # Use SHA256 hash to generate deterministic but varied embeddings
        hash_bytes = hashlib.sha256(query.encode()).digest()

        # Create 1536-dim vector from hash bytes
        # 48 chunks of 4 bytes each = 192 bytes, each chunk fills 32 dims
        vector = np.zeros(1536, dtype=np.float32)

        for i in range(48):
            chunk = int.from_bytes(hash_bytes[i*4:(i+1)*4], 'little')
            # Spread values across 32 dimensions per chunk
            vector[i*32:(i+1)*32] = (chunk % 1000) / 1000.0

        # Normalize to unit vector
        norm = np.linalg.norm(vector)
        if norm > 0:
            vector = vector / norm

        return vector

    def _query_memory_daemon(self, message: dict) -> dict:
        """
        Send a query to the memory daemon via Unix socket.

        Args:
            message: The message dict to send

        Returns:
            Response dict from the daemon, or {"matches": []} on failure
        """
        try:
            if not os.path.exists(self.memory_socket):
                return {"matches": []}

            with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as sock:
                sock.settimeout(5.0)  # 5 second timeout
                sock.connect(self.memory_socket)
                sock.sendall(json.dumps(message).encode('utf-8'))

                response_data = b""
                while True:
                    chunk = sock.recv(40196)
                    if not chunk:
                        break
                    response_data += chunk

                if response_data:
                    return json.loads(response_data.decode('utf-8'))
                return {"matches": []}

        except socket.timeout:
            return {"matches": []}
        except socket.error:
            return {"matches": []}
        except json.JSONDecodeError:
            return {"matches": []}
        except Exception:
            return {"matches": []}

    def map_to_hilbert(self, embedding: np.ndarray) -> Dict:
        """
        Map an embedding vector to Hilbert space coordinates.

        Queries the memory daemon for the nearest match and returns
        its coordinates in the 2D Hilbert space.

        Args:
            embedding: 1536-dim embedding vector

        Returns:
            Dict with 'x' and 'y' coordinates (integers in map_size range)
        """
        message = {
            "message_type": "SynapticQuery",
            "payload": {
                "query_vector": embedding.tolist(),
                "limit": 1
            }
        }

        response = self._query_memory_daemon(message)

        if "matches" in response and len(response["matches"]) > 0:
            best = response["matches"][0]
            return {
                "x": int(best.get("hilbert_x", 0.5) * self.map_size),
                "y": int(best.get("hilbert_y", 0.5) * self.map_size)
            }

        # Default to center if no matches
        return {
            "x": self.map_size // 2,
            "y": self.map_size // 2
        }

    def query(self, query_text: str, limit: int = 10) -> List[Dict]:
        """
        Execute a full semantic search query.

        This is the main entry point for querying. It:
        1. Embeds the query text
        2. Sends it to the memory daemon
        3. Returns ranked results with coordinates

        Args:
            query_text: The text to search for
            limit: Maximum number of results to return

        Returns:
            List of result dicts, each containing:
                - x, y: Hilbert coordinates
                - similarity: Similarity score (0-1)
                - token: Token/content identifier
                - layer: Neural layer reference
                - type: Memory type
        """
        # Embed the query
        embedding = self.embed_query(query_text)

        # Query memory daemon
        message = {
            "message_type": "SynapticQuery",
            "payload": {
                "query_vector": embedding.tolist(),
                "limit": limit
            }
        }

        response = self._query_memory_daemon(message)

        # Process and format results
        results = []
        for match in response.get("matches", []):
            results.append({
                "x": int(match.get("hilbert_x", 0) * self.map_size),
                "y": int(match.get("hilbert_y", 0) * self.map_size),
                "similarity": match.get("similarity", 0),
                "token": match.get("token", ""),
                "layer": match.get("layer", ""),
                "type": match.get("type", "unknown")
            })

        # Sort by similarity (highest first)
        results.sort(key=lambda r: r["similarity"], reverse=True)

        return results


# Convenience function for quick queries
def search(query_text: str, limit: int = 10) -> List[Dict]:
    """
    Quick search function using default settings.

    Args:
        query_text: The text to search for
        limit: Maximum number of results

    Returns:
        List of search results
    """
    engine = SynapticQueryEngine()
    return engine.query(query_text, limit=limit)


if __name__ == "__main__":
    # Demo usage
    engine = SynapticQueryEngine()

    print("Testing Synaptic Query Engine")
    print("=" * 50)

    # Test embedding
    query = "neural network architecture"
    embedding = engine.embed_query(query)
    print(f"Query: '{query}'")
    print(f"Embedding shape: {embedding.shape}")
    print(f"Embedding norm: {np.linalg.norm(embedding):.4f}")
    print()

    # Test Hilbert mapping
    coords = engine.map_to_hilbert(embedding)
    print(f"Hilbert coordinates: ({coords['x']}, {coords['y']})")
    print()

    # Test full query
    results = engine.query(query, limit=5)
    print(f"Query results ({len(results)} found):")
    for r in results:
        print(f"  ({r['x']}, {r['y']}): sim={r['similarity']:.3f}")
