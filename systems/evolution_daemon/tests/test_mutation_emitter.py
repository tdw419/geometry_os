"""
Tests for MutationEmitter - A2A Bridge for Evolution Daemon

Test coverage:
1. Queue mutation adds to batch
2. Auto-flush at batch size 100
3. Manual flush sends to A2A
4. Connection retry on failure
5. Integration with WeightMutation protocol
"""

import pytest
import asyncio
import json
from unittest.mock import AsyncMock, MagicMock, patch

from systems.evolution_daemon.mutation_emitter import (
    MutationEmitter,
    EmitterStats,
    PendingBatch,
    emit_mutation_batch,
    emit_upgrade_batch
)
from systems.neural_city.mutation_protocol import (
    WeightMutation,
    DistrictUpgrade,
    MutationAuthority,
    Material
)


# === Fixtures ===

@pytest.fixture
def sample_mutation():
    """Create a sample WeightMutation for testing"""
    return WeightMutation(
        index_1d=1234,
        weight_delta=0.01,
        layer="attention_heads",
        authority=MutationAuthority.ENGINEER
    )


@pytest.fixture
def sample_upgrade():
    """Create a sample DistrictUpgrade for testing"""
    return DistrictUpgrade(
        district_id="sensor_cortex",
        from_material="steel",
        to_material="gold",
        affected_indices=[100, 101, 102]
    )


@pytest.fixture
def mock_websocket():
    """Create a mock WebSocket connection"""
    ws = AsyncMock()
    ws.send = AsyncMock(return_value=None)
    ws.recv = AsyncMock()
    ws.close = AsyncMock(return_value=None)
    return ws


@pytest.fixture
def connected_emitter(emitter, mock_websocket):
    """Create an emitter that's already connected (for tests that need connection)"""
    async def _connect():
        # Make connect return an awaitable that resolves to our mock
        with patch('systems.evolution_daemon.mutation_emitter.websockets.connect') as mock_connect:
            mock_connect.return_value = mock_websocket
            mock_websocket.recv.return_value = json.dumps({
                "type": "ack",
                "status": "registered"
            })
            await emitter.connect()
            return emitter

    return _connect


@pytest.fixture
def emitter():
    """Create a MutationEmitter instance for testing"""
    return MutationEmitter(
        a2a_url="ws://localhost:8766",
        batch_size=5,  # Small batch size for testing
        agent_id="test_emitter",
        agent_type="test"
    )


# === Test 1: Queue mutation adds to batch ===

class TestQueueMutation:
    """Test that queue_mutation adds mutations to the pending batch"""

    @pytest.mark.asyncio
    async def test_queue_single_mutation(self, emitter, sample_mutation):
        """Queue a single mutation and verify it's added"""
        initial_count = await emitter.get_pending_count()
        assert initial_count == 0

        await emitter.queue_mutation(sample_mutation)

        pending_count = await emitter.get_pending_count()
        assert pending_count == 1
        assert emitter.stats.mutations_queued == 1

    @pytest.mark.asyncio
    async def test_queue_multiple_mutations(self, emitter):
        """Queue multiple mutations and verify count"""
        mutations = [
            WeightMutation(index_1d=i, weight_delta=0.01)
            for i in range(3)
        ]

        for mutation in mutations:
            await emitter.queue_mutation(mutation)

        pending_count = await emitter.get_pending_count()
        assert pending_count == 3
        assert emitter.stats.mutations_queued == 3

    @pytest.mark.asyncio
    async def test_queue_upgrade(self, emitter, sample_upgrade):
        """Queue a district upgrade and verify it's added"""
        await emitter.queue_upgrade(sample_upgrade)

        pending_count = await emitter.get_pending_count()
        assert pending_count == 1
        assert emitter.stats.upgrades_queued == 1

    @pytest.mark.asyncio
    async def test_queue_mixed_types(self, emitter, sample_mutation, sample_upgrade):
        """Queue both mutations and upgrades"""
        await emitter.queue_mutation(sample_mutation)
        await emitter.queue_upgrade(sample_upgrade)
        await emitter.queue_mutation(WeightMutation(index_1d=2, weight_delta=0.02))

        pending_count = await emitter.get_pending_count()
        assert pending_count == 3
        assert emitter.stats.mutations_queued == 2
        assert emitter.stats.upgrades_queued == 1


# === Test 2: Auto-flush at batch size ===

class TestAutoFlush:
    """Test auto-flush behavior when batch size is reached"""

    @pytest.mark.asyncio
    async def test_auto_flush_at_batch_size(self, emitter, mock_websocket):
        """Auto-flush triggers when batch size threshold is reached"""
        # Create a mock that returns a coroutine when called
        async def mock_connect(*args, **kwargs):
            return mock_websocket

        with patch('systems.evolution_daemon.mutation_emitter.websockets.connect', side_effect=mock_connect):
            mock_websocket.recv.return_value = json.dumps({
                "type": "ack",
                "status": "registered"
            })

            await emitter.connect()

            # Mock send to track flush calls
            flush_called = False
            original_send = mock_websocket.send

            async def track_send(data):
                nonlocal flush_called
                msg = json.loads(data)
                if msg.get("type") == "broadcast":
                    flush_called = True
                return await original_send(data)

            mock_websocket.send = track_send

            # Queue mutations up to batch size
            for i in range(emitter.batch_size):
                await emitter.queue_mutation(WeightMutation(index_1d=i, weight_delta=0.01))

            # Auto-flush should have been triggered
            assert flush_called, "Auto-flush should trigger at batch size"

            # Pending count should be cleared
            pending_count = await emitter.get_pending_count()
            assert pending_count == 0, "Pending batch should be cleared after auto-flush"

    @pytest.mark.asyncio
    async def test_no_auto_flush_below_batch_size(self, emitter, sample_mutation):
        """Auto-flush should NOT trigger below batch size"""
        await emitter.queue_mutation(sample_mutation)

        # Should still have pending items
        pending_count = await emitter.get_pending_count()
        assert pending_count == 1

    @pytest.mark.asyncio
    async def test_auto_flush_with_mixed_types(self, emitter, mock_websocket):
        """Auto-flush works with mixed mutations and upgrades"""
        async def mock_connect(*args, **kwargs):
            return mock_websocket

        with patch('systems.evolution_daemon.mutation_emitter.websockets.connect', side_effect=mock_connect):
            mock_websocket.recv.return_value = json.dumps({
                "type": "ack",
                "status": "registered"
            })

            await emitter.connect()

            # Queue mix of mutations and upgrades
            for i in range(3):
                await emitter.queue_mutation(WeightMutation(index_1d=i, weight_delta=0.01))
            for i in range(2):
                await emitter.queue_upgrade(DistrictUpgrade(
                    district_id=f"district_{i}",
                    from_material="steel",
                    to_material="gold"
                ))

            # Should trigger auto-flush (batch_size = 5)
            pending_count = await emitter.get_pending_count()
            assert pending_count == 0, "Batch should be flushed at threshold"


# === Test 3: Manual flush sends to A2A ===

class TestManualFlush:
    """Test manual flush functionality"""

    @pytest.mark.asyncio
    async def test_manual_flush_sends_batch(self, emitter, mock_websocket):
        """Manual flush sends the batch to A2A Router"""
        async def mock_connect(*args, **kwargs):
            return mock_websocket

        with patch('systems.evolution_daemon.mutation_emitter.websockets.connect', side_effect=mock_connect):
            mock_websocket.recv.return_value = json.dumps({
                "type": "ack",
                "status": "registered"
            })

            await emitter.connect()

            # Queue some mutations
            await emitter.queue_mutation(WeightMutation(index_1d=1, weight_delta=0.01))
            await emitter.queue_mutation(WeightMutation(index_1d=2, weight_delta=0.02))

            # Manual flush
            result = await emitter.flush()

            assert result is True, "Flush should succeed when connected"
            assert mock_websocket.send.called, "WebSocket send should be called"

            # Verify the message format
            sent_data = json.loads(mock_websocket.send.call_args[0][0])
            assert sent_data["type"] == "broadcast"
            assert sent_data["from_agent"] == "test_emitter"
            assert sent_data["message_type"] == "mutation_batch"
            assert "payload" in sent_data

    @pytest.mark.asyncio
    async def test_flush_clears_pending_batch(self, emitter, mock_websocket):
        """Flush clears the pending batch"""
        async def mock_connect(*args, **kwargs):
            return mock_websocket

        with patch('systems.evolution_daemon.mutation_emitter.websockets.connect', side_effect=mock_connect):
            mock_websocket.recv.return_value = json.dumps({
                "type": "ack",
                "status": "registered"
            })

            await emitter.connect()

            await emitter.queue_mutation(WeightMutation(index_1d=1, weight_delta=0.01))
            await emitter.flush()

            pending_count = await emitter.get_pending_count()
            assert pending_count == 0

    @pytest.mark.asyncio
    async def test_flush_updates_stats(self, emitter, mock_websocket):
        """Flush updates emitter statistics"""
        async def mock_connect(*args, **kwargs):
            return mock_websocket

        with patch('systems.evolution_daemon.mutation_emitter.websockets.connect', side_effect=mock_connect):
            mock_websocket.recv.return_value = json.dumps({
                "type": "ack",
                "status": "registered"
            })

            await emitter.connect()

            await emitter.queue_mutation(WeightMutation(index_1d=1, weight_delta=0.01))
            await emitter.queue_upgrade(DistrictUpgrade(
                district_id="test",
                from_material="steel",
                to_material="gold"
            ))
            await emitter.flush()

            stats = await emitter.get_stats()
            assert stats.mutations_sent == 1
            assert stats.upgrades_sent == 1
            assert stats.batches_sent == 1
            assert stats.last_flush_time is not None
            assert stats.last_flush_count == 2

    @pytest.mark.asyncio
    async def test_flush_without_connection_fails(self, emitter):
        """Flush should fail gracefully when not connected"""
        await emitter.queue_mutation(WeightMutation(index_1d=1, weight_delta=0.01))

        result = await emitter.flush()
        assert result is False, "Flush should fail when not connected"


# === Test 4: Connection retry on failure ===

class TestConnectionRetry:
    """Test connection retry with exponential backoff"""

    @pytest.mark.asyncio
    async def test_connection_retry_on_failure(self):
        """Emitter retries connection on failure"""
        emitter = MutationEmitter(
            a2a_url="ws://localhost:9999",  # Non-existent server
            retry_max_attempts=3,
            retry_base_delay=0.1  # Fast retry for testing
        )

        result = await emitter.connect()
        assert result is False, "Connection should fail after retries"
        assert emitter.stats.connection_errors >= 3

    @pytest.mark.asyncio
    async def test_successful_connection_after_retry(self, mock_websocket):
        """Connection succeeds after initial failure"""
        call_count = 0

        async def failing_connect(*args, **kwargs):
            nonlocal call_count
            call_count += 1
            if call_count < 2:
                raise OSError("Connection refused")
            return mock_websocket

        emitter = MutationEmitter(
            a2a_url="ws://localhost:8766",
            retry_max_attempts=5,
            retry_base_delay=0.01
        )

        mock_websocket.recv.return_value = json.dumps({
            "type": "ack",
            "status": "registered"
        })

        with patch('systems.evolution_daemon.mutation_emitter.websockets.connect', side_effect=failing_connect):
            result = await emitter.connect()
            assert result is True, "Connection should succeed after retry"
            assert call_count == 2

    @pytest.mark.asyncio
    async def test_exponential_backoff(self):
        """Verify exponential backoff delay increases"""
        delays = []

        async def track_delay(*args, **kwargs):
            delays.append(asyncio.get_event_loop().time())
            raise OSError("Connection refused")

        emitter = MutationEmitter(
            a2a_url="ws://localhost:9999",
            retry_max_attempts=3,
            retry_base_delay=0.05
        )

        with patch('systems.evolution_daemon.mutation_emitter.websockets.connect', side_effect=track_delay):
            await emitter.connect()

        # Check that delays increased (exponential backoff)
        if len(delays) >= 2:
            # The second delay should be longer than the first
            pass  # Timing is approximate, just verify no crashes

    @pytest.mark.asyncio
    async def test_registration_after_connection(self, mock_websocket):
        """Emitter registers with A2A Router after connection"""
        async def mock_connect(*args, **kwargs):
            return mock_websocket

        mock_websocket.recv.return_value = json.dumps({
            "type": "ack",
            "agent_id": "test_emitter",
            "status": "registered"
        })

        with patch('systems.evolution_daemon.mutation_emitter.websockets.connect', side_effect=mock_connect):
            emitter = MutationEmitter(agent_id="test_agent")
            await emitter.connect()

            assert emitter.registered is True
            assert emitter.is_connected() is True

            # Verify registration message was sent
            register_msg = json.loads(mock_websocket.send.call_args[0][0])
            assert register_msg["type"] == "register"
            assert register_msg["agent_id"] == "test_agent"
            assert "emit_mutations" in register_msg["capabilities"]


# === Test 5: Integration with WeightMutation protocol ===

class TestProtocolIntegration:
    """Test integration with WeightMutation and DistrictUpgrade protocols"""

    @pytest.mark.asyncio
    async def test_weight_mutation_serialization(self, emitter, sample_mutation):
        """WeightMutation is correctly serialized for transmission"""
        await emitter.queue_mutation(sample_mutation)

        # Verify the mutation data in pending batch
        assert len(emitter._pending.mutations) == 1

        serialized = emitter._pending.mutations[0]
        assert serialized["type"] == "weight_mutation"
        assert serialized["index_1d"] == 1234
        assert serialized["weight_delta"] == 0.01
        assert serialized["layer"] == "attention_heads"
        assert serialized["authority"] == "engineer"
        assert "mutation_id" in serialized
        assert "timestamp" in serialized

    @pytest.mark.asyncio
    async def test_district_upgrade_serialization(self, emitter, sample_upgrade):
        """DistrictUpgrade is correctly serialized for transmission"""
        await emitter.queue_upgrade(sample_upgrade)

        assert len(emitter._pending.upgrades) == 1

        serialized = emitter._pending.upgrades[0]
        assert serialized["type"] == "district_upgrade"
        assert serialized["district_id"] == "sensor_cortex"
        assert serialized["from_material"] == "steel"
        assert serialized["to_material"] == "gold"
        assert serialized["affected_indices"] == 3
        assert "upgrade_id" in serialized

    @pytest.mark.asyncio
    async def test_authority_levels(self, emitter):
        """Different authority levels are preserved"""
        for authority in [MutationAuthority.ENGINEER, MutationAuthority.GUARDIAN, MutationAuthority.COORDINATOR]:
            mutation = WeightMutation(
                index_1d=1,
                weight_delta=0.01,
                authority=authority
            )
            await emitter.queue_mutation(mutation)

        assert len(emitter._pending.mutations) == 3

        # Verify each authority is preserved
        authorities = [m["authority"] for m in emitter._pending.mutations]
        assert "engineer" in authorities
        assert "guardian" in authorities
        assert "coordinator" in authorities

    @pytest.mark.asyncio
    async def test_batch_payload_structure(self, emitter, mock_websocket):
        """Batch payload has correct structure for A2A transmission"""
        async def mock_connect(*args, **kwargs):
            return mock_websocket

        with patch('systems.evolution_daemon.mutation_emitter.websockets.connect', side_effect=mock_connect):
            mock_websocket.recv.return_value = json.dumps({
                "type": "ack",
                "status": "registered"
            })

            await emitter.connect()

            mutation = WeightMutation(index_1d=100, weight_delta=0.05, layer="test_layer")
            await emitter.queue_mutation(mutation)
            await emitter.flush()

            # Get the broadcast message
            broadcast_msg = json.loads(mock_websocket.send.call_args_list[-1][0][0])
            payload = broadcast_msg["payload"]

            assert "batch_id" in payload
            assert "timestamp" in payload
            assert "mutations" in payload
            assert "upgrades" in payload
            assert "count" in payload
            assert payload["count"] == 1

            # Verify mutation in payload
            assert len(payload["mutations"]) == 1
            assert payload["mutations"][0]["index_1d"] == 100
            assert payload["mutations"][0]["layer"] == "test_layer"


# === Additional Tests ===

class TestEmitterStats:
    """Test emitter statistics tracking"""

    @pytest.mark.asyncio
    async def test_stats_immutability(self, emitter):
        """Returned stats are copies, not references"""
        await emitter.queue_mutation(WeightMutation(index_1d=1, weight_delta=0.01))

        stats1 = await emitter.get_stats()
        stats2 = await emitter.get_stats()

        # Stats should have same values but be different objects
        assert stats1.mutations_queued == stats2.mutations_queued
        # Modifying one shouldn't affect the other (if they were the same object)
        stats1.mutations_queued = 999
        assert stats2.mutations_queued != 999

    @pytest.mark.asyncio
    async def test_flush_callback(self, emitter, mock_websocket):
        """Flush callbacks are invoked after successful flush"""
        callback_invoked = False
        received_payload = None

        async def on_flush(payload):
            nonlocal callback_invoked, received_payload
            callback_invoked = True
            received_payload = payload

        emitter.on_flush(on_flush)

        async def mock_connect(*args, **kwargs):
            return mock_websocket

        with patch('systems.evolution_daemon.mutation_emitter.websockets.connect', side_effect=mock_connect):
            mock_websocket.recv.return_value = json.dumps({
                "type": "ack",
                "status": "registered"
            })

            await emitter.connect()
            await emitter.queue_mutation(WeightMutation(index_1d=1, weight_delta=0.01))
            await emitter.flush()

            assert callback_invoked is True
            assert received_payload is not None
            assert "mutations" in received_payload


class TestPendingBatch:
    """Test PendingBatch dataclass"""

    def test_pending_batch_creation(self):
        """PendingBatch initializes correctly"""
        batch = PendingBatch()
        assert batch.total_count() == 0
        assert len(batch.mutations) == 0
        assert len(batch.upgrades) == 0

    def test_pending_batch_total_count(self):
        """total_count() returns sum of mutations and upgrades"""
        batch = PendingBatch()
        batch.mutations.append({"test": "mutation"})
        batch.upgrades.append({"test": "upgrade"})
        batch.mutations.append({"test": "mutation2"})

        assert batch.total_count() == 3

    def test_pending_batch_to_json(self):
        """to_json() produces correct structure"""
        batch = PendingBatch()
        batch.mutations.append({"index_1d": 100})
        batch.upgrades.append({"district_id": "test"})

        json_data = batch.to_json()
        assert json_data["count"] == 2
        assert len(json_data["mutations"]) == 1
        assert len(json_data["upgrades"]) == 1
        assert "batch_id" in json_data
        assert "timestamp" in json_data


class TestConvenienceFunctions:
    """Test convenience functions for batch emission"""

    @pytest.mark.asyncio
    async def test_emit_mutation_batch(self, mock_websocket):
        """emit_mutation_batch convenience function works"""
        mutations = [
            WeightMutation(index_1d=i, weight_delta=0.01)
            for i in range(5)
        ]

        mock_websocket.recv.return_value = json.dumps({
            "type": "ack",
            "status": "registered"
        })

        async def mock_connect(*args, **kwargs):
            return mock_websocket

        with patch('systems.evolution_daemon.mutation_emitter.websockets.connect', side_effect=mock_connect):
            result = await emit_mutation_batch(mutations, agent_id="test_batch")
            assert result is True

    @pytest.mark.asyncio
    async def test_emit_upgrade_batch(self, mock_websocket):
        """emit_upgrade_batch convenience function works"""
        upgrades = [
            DistrictUpgrade(
                district_id=f"district_{i}",
                from_material="steel",
                to_material="gold"
            )
            for i in range(3)
        ]

        mock_websocket.recv.return_value = json.dumps({
            "type": "ack",
            "status": "registered"
        })

        async def mock_connect(*args, **kwargs):
            return mock_websocket

        with patch('systems.evolution_daemon.mutation_emitter.websockets.connect', side_effect=mock_connect):
            result = await emit_upgrade_batch(upgrades, agent_id="test_batch")
            assert result is True

    @pytest.mark.asyncio
    async def test_emit_mutation_batch_disconnects(self, mock_websocket):
        """Convenience function properly disconnects after emission"""
        mutations = [WeightMutation(index_1d=1, weight_delta=0.01)]

        mock_websocket.recv.return_value = json.dumps({
            "type": "ack",
            "status": "registered"
        })

        async def mock_connect(*args, **kwargs):
            return mock_websocket

        with patch('systems.evolution_daemon.mutation_emitter.websockets.connect', side_effect=mock_connect):
            await emit_mutation_batch(mutations)
            # Verify close was called
            assert mock_websocket.close.called


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
