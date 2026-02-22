"""
Integration tests for Synaptic Query Interface.

Tests the full query flow:
1. User query -> SynapticQueryEngine -> Memory daemon -> Results
2. VisualBridge routing of synaptic_query messages
3. Coordinate mapping consistency
4. Embedding determinism
5. UI response format compatibility
"""

import pytest
import asyncio
import numpy as np
import sys
import os
from unittest.mock import MagicMock, patch, AsyncMock
from typing import Dict, Any, List

# Add parent directory to path for imports
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from synaptic_query_engine import SynapticQueryEngine


class TestSynapticQueryIntegration:
    """Integration tests for the complete synaptic query flow."""

    @pytest.fixture
    def engine(self):
        """Create a SynapticQueryEngine instance."""
        return SynapticQueryEngine()

    @pytest.fixture
    def mock_memory_daemon_response(self):
        """Create a mock memory daemon response."""
        return {
            "matches": [
                {
                    "hilbert_x": 0.5,
                    "hilbert_y": 0.75,
                    "similarity": 0.92,
                    "token": "attention head implementation",
                    "layer": "transformer",
                    "type": "memory"
                }
            ]
        }

    def test_full_query_flow_with_mocked_daemon(self, engine, mock_memory_daemon_response):
        """Test that a query flows through the entire pipeline."""
        with patch.object(engine, '_query_memory_daemon', return_value=mock_memory_daemon_response):
            results = engine.query("attention heads for Rust code", limit=10)

            assert isinstance(results, list)
            assert len(results) == 1

            result = results[0]
            # Check all expected keys are present
            assert 'x' in result
            assert 'y' in result
            assert 'similarity' in result
            assert 'token' in result
            assert 'type' in result

            # Check coordinate conversion (0.5 * 16384 = 8192)
            assert result['x'] == int(0.5 * 16384)
            assert result['y'] == int(0.75 * 16384)

            # Check similarity is preserved
            assert result['similarity'] == 0.92

    def test_embedding_determinism(self, engine):
        """Test that the same query produces the same embedding."""
        query = "test query for determinism"

        embedding1 = engine.embed_query(query)
        embedding2 = engine.embed_query(query)

        # Embeddings should be identical for same input
        np.testing.assert_array_equal(embedding1, embedding2)

    def test_embedding_different_queries_produce_different_embeddings(self, engine):
        """Test that different queries produce different embeddings."""
        embedding1 = engine.embed_query("first query")
        embedding2 = engine.embed_query("second query")

        # Embeddings should be different
        assert not np.array_equal(embedding1, embedding2)

    def test_coordinate_mapping_consistency(self, engine):
        """Test that Hilbert coordinate mapping is consistent."""
        # Create a known embedding
        embedding = np.random.rand(1536).astype(np.float32)

        coords1 = engine.map_to_hilbert(embedding)
        coords2 = engine.map_to_hilbert(embedding)

        # Same embedding should produce same coordinates
        assert coords1['x'] == coords2['x']
        assert coords1['y'] == coords2['y']

        # Coordinates should be in valid range (16384x16384 map by default)
        assert 0 <= coords1['x'] < 16384
        assert 0 <= coords1['y'] < 16384

    def test_coordinate_mapping_with_custom_map_size(self):
        """Test that coordinate mapping respects custom map size."""
        map_size = 2048
        engine = SynapticQueryEngine(map_size=map_size)
        embedding = np.random.rand(1536).astype(np.float32)

        coords = engine.map_to_hilbert(embedding)

        # Coordinates should be within custom map bounds
        assert 0 <= coords['x'] < map_size
        assert 0 <= coords['y'] < map_size

    def test_ui_response_format(self, engine, mock_memory_daemon_response):
        """Test that results are in correct format for UI."""
        expected_keys = {'x', 'y', 'similarity', 'token', 'type', 'layer'}

        with patch.object(engine, '_query_memory_daemon', return_value=mock_memory_daemon_response):
            results = engine.query("test query")

            assert len(results) == 1
            result = results[0]

            # Check all expected keys are present
            for key in expected_keys:
                assert key in result, f"Missing key: {key}"

            # Check types
            assert isinstance(result['x'], (int, float))
            assert isinstance(result['y'], (int, float))
            assert isinstance(result['similarity'], float)
            assert 0 <= result['similarity'] <= 1
            assert isinstance(result['token'], str)
            assert isinstance(result['type'], str)

    def test_results_sorted_by_similarity(self, engine):
        """Test that results are sorted by similarity in descending order."""
        mock_response = {
            "matches": [
                {"hilbert_x": 0.1, "hilbert_y": 0.1, "similarity": 0.5, "token": "low", "layer": "", "type": "memory"},
                {"hilbert_x": 0.5, "hilbert_y": 0.5, "similarity": 0.95, "token": "high", "layer": "", "type": "memory"},
                {"hilbert_x": 0.3, "hilbert_y": 0.3, "similarity": 0.75, "token": "mid", "layer": "", "type": "memory"},
            ]
        }

        with patch.object(engine, '_query_memory_daemon', return_value=mock_response):
            results = engine.query("test query")

            # Should be sorted by similarity descending
            assert len(results) == 3
            assert results[0]['similarity'] >= results[1]['similarity']
            assert results[1]['similarity'] >= results[2]['similarity']
            assert results[0]['token'] == "high"
            assert results[1]['token'] == "mid"
            assert results[2]['token'] == "low"

    def test_empty_results_on_no_matches(self, engine):
        """Test that empty results are returned when no matches found."""
        mock_response = {"matches": []}

        with patch.object(engine, '_query_memory_daemon', return_value=mock_response):
            results = engine.query("obscure query")

            assert isinstance(results, list)
            assert len(results) == 0


class TestVisualBridgeIntegration:
    """Test VisualBridge handler integration."""

    def test_handle_synaptic_query_imports(self):
        """Test that handle_synaptic_query can be imported from visual_bridge."""
        from systems.visual_shell.api.visual_bridge import handle_synaptic_query

        assert callable(handle_synaptic_query)

    @pytest.mark.asyncio
    async def test_visual_bridge_handler_returns_correct_format(self):
        """Test that VisualBridge handler correctly routes to engine."""
        from systems.visual_shell.api.visual_bridge import handle_synaptic_query

        # Create a mock bridge
        mock_bridge = MagicMock()
        mock_bridge.clients = set()
        mock_bridge._broadcast = AsyncMock()

        # Create test query data
        query_data = {'query': 'attention heads', 'limit': 5}

        # Call the handler
        response = await handle_synaptic_query(mock_bridge, query_data)

        # Verify response format
        assert response['type'] == 'synaptic_query_response'
        assert 'results' in response
        assert 'navigate_to' in response
        assert isinstance(response['results'], list)

    @pytest.mark.asyncio
    async def test_visual_bridge_handler_with_results(self):
        """Test VisualBridge handler with mocked engine results."""
        from systems.visual_shell.api.visual_bridge import handle_synaptic_query
        from systems.neural_city.synaptic_query_engine import SynapticQueryEngine

        # Mock the engine's query method
        mock_results = [
            {'x': 500, 'y': 600, 'similarity': 0.85, 'token': 'test result', 'layer': 'test', 'type': 'memory'}
        ]

        with patch.object(SynapticQueryEngine, 'query', return_value=mock_results):
            mock_bridge = MagicMock()
            query_data = {'query': 'test', 'limit': 10}

            response = await handle_synaptic_query(mock_bridge, query_data)

            assert response['type'] == 'synaptic_query_response'
            assert len(response['results']) == 1
            assert response['navigate_to']['x'] == 500
            assert response['navigate_to']['y'] == 600

    @pytest.mark.asyncio
    async def test_visual_bridge_handler_no_results(self):
        """Test VisualBridge handler when no results are found."""
        from systems.visual_shell.api.visual_bridge import handle_synaptic_query

        mock_bridge = MagicMock()
        query_data = {'query': 'nonexistent query'}

        response = await handle_synaptic_query(mock_bridge, query_data)

        assert response['type'] == 'synaptic_query_response'
        assert response['results'] == []
        assert response['navigate_to'] is None

    @pytest.mark.asyncio
    async def test_visual_bridge_handler_respects_limit(self):
        """Test that VisualBridge handler passes limit to engine."""
        from systems.visual_shell.api.visual_bridge import handle_synaptic_query
        from systems.neural_city.synaptic_query_engine import SynapticQueryEngine

        with patch.object(SynapticQueryEngine, 'query') as mock_query:
            mock_query.return_value = []

            mock_bridge = MagicMock()
            query_data = {'query': 'test', 'limit': 25}

            await handle_synaptic_query(mock_bridge, query_data)

            # Verify limit was passed correctly
            mock_query.assert_called_once_with('test', limit=25)


class TestSynapticQueryEndToEnd:
    """End-to-end tests for the synaptic query interface."""

    def test_engine_can_be_instantiated(self):
        """Test that engine can be created with default settings."""
        engine = SynapticQueryEngine()

        assert engine.memory_socket == "/tmp/vector_memory_daemon.sock"
        assert engine.embedding_model == "mock"
        assert engine.map_size == 16384

    def test_engine_with_custom_settings(self):
        """Test engine instantiation with custom settings."""
        engine = SynapticQueryEngine(
            memory_socket="/custom/socket.sock",
            embedding_model="mock",
            map_size=4096
        )

        assert engine.memory_socket == "/custom/socket.sock"
        assert engine.map_size == 4096

    def test_embedding_produces_normalized_vector(self):
        """Test that embedding produces a unit vector."""
        engine = SynapticQueryEngine()

        for query in ["short", "a longer query with more words", "123 numbers and symbols!@#"]:
            embedding = engine.embed_query(query)

            # Check it's normalized
            norm = np.linalg.norm(embedding)
            assert abs(norm - 1.0) < 0.0001, f"Embedding not normalized for '{query}': norm={norm}"

    def test_embedding_dimension(self):
        """Test that embedding always produces 1536 dimensions."""
        engine = SynapticQueryEngine()

        for query in ["", "a", "medium length query", "x" * 1000]:
            embedding = engine.embed_query(query)
            assert embedding.shape == (1536,), f"Wrong shape for query length {len(query)}"

    def test_query_without_daemon_returns_empty(self):
        """Test that query returns empty list when daemon is unavailable."""
        engine = SynapticQueryEngine(memory_socket="/tmp/nonexistent_daemon_socket_xyz.sock")

        results = engine.query("any query")

        # Should return empty list without raising
        assert isinstance(results, list)
        assert len(results) == 0


class TestCoordinateMappingEdgeCases:
    """Test edge cases in coordinate mapping."""

    @pytest.fixture
    def engine(self):
        return SynapticQueryEngine(map_size=16384)

    def test_map_to_hilbert_zero_embedding(self, engine):
        """Test mapping a zero embedding."""
        zero_embedding = np.zeros(1536, dtype=np.float32)

        coords = engine.map_to_hilbert(zero_embedding)

        # Should return center coordinates (default behavior)
        assert coords['x'] == 16384 // 2
        assert coords['y'] == 16384 // 2

    def test_map_to_hilbert_with_mock_response(self, engine):
        """Test mapping with a mocked daemon response."""
        mock_response = {
            "matches": [
                {"hilbert_x": 0.0, "hilbert_y": 1.0}
            ]
        }

        with patch.object(engine, '_query_memory_daemon', return_value=mock_response):
            embedding = np.random.rand(1536).astype(np.float32)
            coords = engine.map_to_hilbert(embedding)

            # 0.0 * 16384 = 0, 1.0 * 16384 = 16384 (but int() truncates)
            assert coords['x'] == 0
            assert coords['y'] == 16384

    def test_map_to_hilbert_empty_matches(self, engine):
        """Test mapping when daemon returns empty matches."""
        mock_response = {"matches": []}

        with patch.object(engine, '_query_memory_daemon', return_value=mock_response):
            embedding = np.random.rand(1536).astype(np.float32)
            coords = engine.map_to_hilbert(embedding)

            # Should return center
            assert coords['x'] == 16384 // 2
            assert coords['y'] == 16384 // 2


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
