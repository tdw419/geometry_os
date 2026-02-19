"""
Tests for Synaptic Query Engine.

Tests verify the query engine can:
1. Embed queries to 1536-dim vectors
2. Map embeddings to Hilbert coordinates
3. Execute full search flow
4. Handle edge cases (no results)
"""

import pytest
import numpy as np
import sys
import os

# Add parent directory to path for imports
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from synaptic_query_engine import SynapticQueryEngine


class TestSynapticQueryEngine:
    """Test suite for SynapticQueryEngine."""

    def test_embed_query_returns_vector(self):
        """Verify embed_query returns a 1536-dimensional normalized vector."""
        engine = SynapticQueryEngine()
        query = "test query for embedding"

        vector = engine.embed_query(query)

        # Check it's a numpy array
        assert isinstance(vector, np.ndarray), "embed_query should return numpy array"

        # Check dimension is 1536
        assert vector.shape == (1536,), f"Expected 1536 dimensions, got {vector.shape}"

        # Check it's normalized (unit vector)
        norm = np.linalg.norm(vector)
        assert abs(norm - 1.0) < 0.001, f"Vector should be normalized, norm={norm}"

        # Check values are in valid range
        assert np.all(vector >= 0) and np.all(vector <= 1), "Values should be in [0, 1]"

    def test_map_to_hilbert_returns_coordinates(self):
        """Verify map_to_hilbert returns {x, y} coordinates."""
        engine = SynapticQueryEngine(map_size=16384)

        # Create a mock embedding
        embedding = np.random.rand(1536).astype(np.float32)
        embedding = embedding / np.linalg.norm(embedding)

        coords = engine.map_to_hilbert(embedding)

        # Check it returns a dict with x and y
        assert isinstance(coords, dict), "map_to_hilbert should return dict"
        assert "x" in coords, "Result should contain 'x' key"
        assert "y" in coords, "Result should contain 'y' key"

        # Check coordinates are integers within bounds
        assert isinstance(coords["x"], int), "x should be int"
        assert isinstance(coords["y"], int), "y should be int"
        assert 0 <= coords["x"] < 16384, f"x out of bounds: {coords['x']}"
        assert 0 <= coords["y"] < 16384, f"y out of bounds: {coords['y']}"

    def test_query_returns_results(self):
        """Verify query returns list of results with expected structure."""
        engine = SynapticQueryEngine()

        # Query that should work even with mock daemon
        results = engine.query("test query", limit=5)

        # Check it returns a list
        assert isinstance(results, list), "query should return list"

        # When no daemon is running, it should return empty list gracefully
        # But let's verify the structure is correct
        for result in results:
            assert "x" in result, "Result should have 'x'"
            assert "y" in result, "Result should have 'y'"
            assert "similarity" in result, "Result should have 'similarity'"
            assert "token" in result, "Result should have 'token'"
            assert "layer" in result, "Result should have 'layer'"
            assert "type" in result, "Result should have 'type'"

    def test_query_with_no_results_returns_empty(self):
        """Verify query with no matches returns empty list gracefully."""
        engine = SynapticQueryEngine(memory_socket="/tmp/nonexistent_socket.sock")

        # Query with socket that doesn't exist
        results = engine.query("obscure query with no matches", limit=10)

        # Should return empty list, not raise exception
        assert isinstance(results, list), "Should return list"
        assert len(results) == 0, "Should return empty list when no results"


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
