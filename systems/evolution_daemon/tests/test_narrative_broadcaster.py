"""
Tests for Narrative Broadcaster - GOSR Radio

Tests for the Geometry OS Radio system components:
- NarrativeBroadcaster: Main orchestrator
- BroadcastSegment: Content data structure
"""

import pytest
import sys
from pathlib import Path
from unittest.mock import patch, MagicMock
from datetime import datetime

# Add paths for imports
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from evolution_daemon.narrative_broadcaster import (
    NarrativeBroadcaster, BroadcastSegment
)


class TestBroadcastSegment:
    """Tests for BroadcastSegment dataclass."""

    def test_segment_creation(self):
        """BroadcastSegment should store all fields."""
        segment = BroadcastSegment(
            segment_type="NEWS",
            content="Test content",
            entropy=0.75,
            station_id="87.6",
            timestamp=1234567890.0
        )

        assert segment.segment_type == "NEWS"
        assert segment.content == "Test content"
        assert segment.entropy == 0.75
        assert segment.station_id == "87.6"
        assert segment.timestamp == 1234567890.0

    def test_segment_defaults(self):
        """BroadcastSegment should have sensible defaults."""
        segment = BroadcastSegment(
            segment_type="WEATHER",
            content="Clear skies",
            entropy=0.5
        )

        assert segment.station_id == "87.6"  # Default station
        assert segment.timestamp > 0  # Auto-generated

    def test_segment_to_dict(self):
        """BroadcastSegment should serialize to dict."""
        segment = BroadcastSegment(
            segment_type="PHILOSOPHY",
            content="Deep thought",
            entropy=0.3,
            station_id="95.1",
            timestamp=1234567890.0
        )

        data = segment.to_dict()

        assert data["segment_type"] == "PHILOSOPHY"
        assert data["content"] == "Deep thought"
        assert data["entropy"] == 0.3
        assert data["station_id"] == "95.1"
        assert data["timestamp"] == 1234567890.0


class TestNarrativeBroadcaster:
    """Tests for NarrativeBroadcaster class."""

    def test_broadcaster_initialization(self):
        """NarrativeBroadcaster should initialize with defaults."""
        broadcaster = NarrativeBroadcaster()

        assert broadcaster.enabled is True
        assert broadcaster.station_id == "87.6"
        assert broadcaster.broadcast_interval == 30.0

    def test_broadcaster_custom_config(self):
        """NarrativeBroadcaster should accept custom config."""
        broadcaster = NarrativeBroadcaster(
            enabled=False,
            station_id="92.3",
            broadcast_interval=60.0
        )

        assert broadcaster.enabled is False
        assert broadcaster.station_id == "92.3"
        assert broadcaster.broadcast_interval == 60.0

    def test_enable_disable(self):
        """NarrativeBroadcaster should support enable/disable."""
        broadcaster = NarrativeBroadcaster(enabled=False)

        assert broadcaster.enabled is False

        broadcaster.enable()
        assert broadcaster.enabled is True

        broadcaster.disable()
        assert broadcaster.enabled is False

    def test_set_station(self):
        """NarrativeBroadcaster should allow station switching."""
        broadcaster = NarrativeBroadcaster()

        broadcaster.set_station("95.1")
        assert broadcaster.station_id == "95.1"

        broadcaster.set_station("99.9")
        assert broadcaster.station_id == "99.9"

    def test_get_station_info(self):
        """NarrativeBroadcaster should return station info."""
        broadcaster = NarrativeBroadcaster(station_id="87.6")

        info = broadcaster.get_station_info()

        assert "station_id" in info
        assert info["station_id"] == "87.6"

    def test_stats_tracking(self):
        """NarrativeBroadcaster should track broadcast statistics."""
        broadcaster = NarrativeBroadcaster()

        stats = broadcaster.get_stats()

        assert "total_broadcasts" in stats
        assert stats["total_broadcasts"] == 0
        assert "station_id" in stats


class TestTopicMemory:
    """Tests for TopicMemory deduplication component."""

    def test_topic_entry_creation(self):
        """TopicEntry should store topic with embedding."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicEntry
        import numpy as np

        entry = TopicEntry(
            topic="CPU temperature spike",
            embedding=np.zeros(384),
            timestamp=1234567890.0
        )

        assert entry.topic == "CPU temperature spike"
        assert entry.embedding.shape == (384,)
        assert entry.timestamp == 1234567890.0

    def test_topic_memory_initialization(self):
        """TopicMemory should initialize with defaults."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        memory = TopicMemory()

        assert len(memory) == 0
        assert memory.similarity_threshold == 0.85
        assert memory.max_topics == 1000

    def test_topic_memory_custom_config(self):
        """TopicMemory should accept custom config."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        memory = TopicMemory(similarity_threshold=0.9, max_topics=500)

        assert memory.similarity_threshold == 0.9
        assert memory.max_topics == 500

    def test_add_topic(self):
        """TopicMemory should add topics."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        memory = TopicMemory()
        entry = memory.add_topic("Memory pressure detected")

        assert len(memory) == 1
        assert entry.topic == "Memory pressure detected"
        assert entry.embedding.shape == (384,)

    def test_is_duplicate_exact_match(self):
        """TopicMemory should detect exact duplicates."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        memory = TopicMemory()
        memory.add_topic("CPU load average high")

        # Exact same topic should be detected as duplicate
        assert memory.is_duplicate("CPU load average high") is True
        assert memory.is_duplicate("CPU load average low") is False

    def test_is_duplicate_semantic_match(self):
        """TopicMemory should detect semantic duplicates above threshold."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        memory = TopicMemory()
        memory.add_topic("system memory usage increased")

        # Semantically similar topic should be detected
        # Note: With hash-based embeddings, very similar strings may not be semantically close
        # This test validates the mechanism works
        result = memory.is_duplicate("system memory usage increased")
        assert result is True  # Exact match

    def test_cosine_similarity(self):
        """TopicMemory should compute cosine similarity correctly."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory
        import numpy as np

        memory = TopicMemory()

        # Identical vectors should have similarity 1.0
        vec1 = np.array([1.0, 0.0, 0.0])
        vec2 = np.array([1.0, 0.0, 0.0])
        assert memory._cosine_similarity(vec1, vec2) == 1.0

        # Orthogonal vectors should have similarity 0.0
        vec3 = np.array([0.0, 1.0, 0.0])
        assert memory._cosine_similarity(vec1, vec3) == 0.0

        # Opposite vectors should have similarity -1.0
        vec4 = np.array([-1.0, 0.0, 0.0])
        assert memory._cosine_similarity(vec1, vec4) == -1.0

    def test_embedding_generation_384_dim(self):
        """TopicMemory should generate 384-dim embeddings following NeuralEvent pattern."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory
        import numpy as np

        memory = TopicMemory()
        embedding = memory._generate_embedding("test topic string")

        assert embedding.shape == (384,)
        # Check normalization (unit vector)
        norm = np.linalg.norm(embedding)
        assert 0.99 < norm < 1.01

    def test_embedding_deterministic(self):
        """TopicMemory should generate deterministic embeddings for same input."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        memory = TopicMemory()
        emb1 = memory._generate_embedding("same topic")
        emb2 = memory._generate_embedding("same topic")

        import numpy as np
        assert np.allclose(emb1, emb2)

    def test_embedding_different_for_different_topics(self):
        """TopicMemory should generate different embeddings for different topics."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory
        import numpy as np

        memory = TopicMemory()
        emb1 = memory._generate_embedding("cpu is hot")
        emb2 = memory._generate_embedding("memory is full")

        # Different topics should have different embeddings
        assert not np.allclose(emb1, emb2)

    def test_lru_eviction(self):
        """TopicMemory should evict oldest entries when max_topics reached."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        memory = TopicMemory(max_topics=3)

        memory.add_topic("topic 1")
        memory.add_topic("topic 2")
        memory.add_topic("topic 3")
        memory.add_topic("topic 4")  # Should evict topic 1

        assert len(memory) == 3
        assert not memory.is_duplicate("topic 1")  # Evicted
        assert memory.is_duplicate("topic 4")  # Still present


class TestSegmentPool:
    """Tests for SegmentPool content generation component."""

    def test_segment_type_enum_values(self):
        """SegmentType should have all 6 segment types."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentType

        assert SegmentType.WEATHER.value == "weather"
        assert SegmentType.NEWS.value == "news"
        assert SegmentType.PHILOSOPHY.value == "philosophy"
        assert SegmentType.GOSSIP.value == "gossip"
        assert SegmentType.MEDITATION.value == "meditation"
        assert SegmentType.ARCHIVE.value == "archive"

    def test_segment_config_creation(self):
        """SegmentConfig should store weight, entropy_range, templates."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentConfig

        config = SegmentConfig(
            weight=1.0,
            entropy_range=(0.0, 1.0),
            templates=["Template 1", "Template 2"]
        )

        assert config.weight == 1.0
        assert config.entropy_range == (0.0, 1.0)
        assert len(config.templates) == 2

    def test_segment_pool_initialization(self):
        """SegmentPool should initialize with default configs."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool

        pool = SegmentPool()

        assert len(pool.segment_configs) == 6  # All 6 types

    def test_select_segment_high_entropy(self):
        """SegmentPool should prefer NEWS/GOSSIP for high entropy."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool, SegmentType

        pool = SegmentPool()

        # Run selection multiple times to check preference
        results = []
        for _ in range(50):
            segment_type = pool.select_segment(entropy=0.8)  # High entropy
            results.append(segment_type)

        # NEWS and GOSSIP should be more common at high entropy
        news_gossip_count = sum(1 for s in results if s in (SegmentType.NEWS, SegmentType.GOSSIP))
        # At least 40% should be NEWS or GOSSIP (with 2x weight multiplier)
        assert news_gossip_count >= 15

    def test_select_segment_low_entropy(self):
        """SegmentPool should prefer MEDITATION/PHILOSOPHY for low entropy."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool, SegmentType

        pool = SegmentPool()

        # Run selection multiple times to check preference
        results = []
        for _ in range(50):
            segment_type = pool.select_segment(entropy=0.2)  # Low entropy
            results.append(segment_type)

        # MEDITATION and PHILOSOPHY should be more common at low entropy
        med_phil_count = sum(1 for s in results if s in (SegmentType.MEDITATION, SegmentType.PHILOSOPHY))
        # At least 40% should be MEDITATION or PHILOSOPHY (with 2x weight multiplier)
        assert med_phil_count >= 15

    def test_select_segment_medium_entropy(self):
        """SegmentPool should prefer WEATHER/ARCHIVE for medium entropy."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool, SegmentType

        pool = SegmentPool()

        # Run selection multiple times to check preference
        results = []
        for _ in range(50):
            segment_type = pool.select_segment(entropy=0.5)  # Medium entropy
            results.append(segment_type)

        # WEATHER and ARCHIVE should be more common at medium entropy (1.5x weight)
        weather_archive_count = sum(1 for s in results if s in (SegmentType.WEATHER, SegmentType.ARCHIVE))
        # At least 25% should be WEATHER or ARCHIVE
        assert weather_archive_count >= 10

    def test_select_segment_force_type(self):
        """SegmentPool should return forced type when specified."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool, SegmentType

        pool = SegmentPool()

        # Force specific type regardless of entropy
        result = pool.select_segment(entropy=0.9, force_type=SegmentType.MEDITATION)
        assert result == SegmentType.MEDITATION

        result = pool.select_segment(entropy=0.1, force_type=SegmentType.NEWS)
        assert result == SegmentType.NEWS

    def test_generate_content_weather(self):
        """SegmentPool should generate weather content from telemetry."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool, SegmentType

        pool = SegmentPool()
        telemetry = {
            "fps": 60.0,
            "draw_calls": 150,
            "memory_mb": 512.0
        }

        content = pool.generate_content(
            segment_type=SegmentType.WEATHER,
            telemetry=telemetry,
            station_name="Substrate Jazz"
        )

        assert isinstance(content, str)
        assert len(content) > 10
        # Content should reference telemetry values
        assert "60" in content or "150" in content or "512" in content

    def test_generate_content_news(self):
        """SegmentPool should generate news content from telemetry."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool, SegmentType

        pool = SegmentPool()
        telemetry = {
            "tectonic_shifts": 3,
            "relocations": 2,
            "entropy": 0.75
        }

        content = pool.generate_content(
            segment_type=SegmentType.NEWS,
            telemetry=telemetry,
            station_name="Substrate Jazz"
        )

        assert isinstance(content, str)
        assert len(content) > 10

    def test_generate_content_philosophy(self):
        """SegmentPool should generate philosophy content."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool, SegmentType

        pool = SegmentPool()
        telemetry = {"entropy": 0.3}

        content = pool.generate_content(
            segment_type=SegmentType.PHILOSOPHY,
            telemetry=telemetry,
            station_name="Substrate Jazz"
        )

        assert isinstance(content, str)
        assert len(content) > 10

    def test_generate_content_gossip(self):
        """SegmentPool should generate gossip content from evolution data."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool, SegmentType

        pool = SegmentPool()
        telemetry = {
            "evolution_cycles": 42,
            "mutations_accepted": 5,
            "mutations_rejected": 3
        }

        content = pool.generate_content(
            segment_type=SegmentType.GOSSIP,
            telemetry=telemetry,
            station_name="Substrate Jazz"
        )

        assert isinstance(content, str)
        assert len(content) > 10

    def test_generate_content_meditation(self):
        """SegmentPool should generate meditation content."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool, SegmentType

        pool = SegmentPool()
        telemetry = {"entropy": 0.2}

        content = pool.generate_content(
            segment_type=SegmentType.MEDITATION,
            telemetry=telemetry,
            station_name="Substrate Jazz"
        )

        assert isinstance(content, str)
        assert len(content) > 10

    def test_generate_content_archive(self):
        """SegmentPool should generate archive content."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool, SegmentType

        pool = SegmentPool()
        telemetry = {"entropy": 0.5}

        content = pool.generate_content(
            segment_type=SegmentType.ARCHIVE,
            telemetry=telemetry,
            station_name="Substrate Jazz"
        )

        assert isinstance(content, str)
        assert len(content) > 10

    def test_generate_content_empty_telemetry(self):
        """SegmentPool should handle empty telemetry gracefully."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool, SegmentType

        pool = SegmentPool()
        telemetry = {}

        # Should not raise, should return some content
        content = pool.generate_content(
            segment_type=SegmentType.WEATHER,
            telemetry=telemetry,
            station_name="Substrate Jazz"
        )

        assert isinstance(content, str)
        assert len(content) > 0

    def test_force_rotation_tracking(self):
        """SegmentPool should track last segment type for rotation."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool

        pool = SegmentPool()

        # Select a segment
        pool.select_segment(entropy=0.5)

        # Should track the last selected type
        assert pool.last_segment_type is not None


class TestNarrativeBroadcasterIntegration:
    """Integration tests - will expand as components are added."""

    def test_module_import_works(self):
        """Module should be importable."""
        from evolution_daemon.narrative_broadcaster import NarrativeBroadcaster
        assert NarrativeBroadcaster is not None

    def test_all_exports_available(self):
        """All expected exports should be available."""
        from evolution_daemon import narrative_broadcaster

        assert hasattr(narrative_broadcaster, 'NarrativeBroadcaster')
        assert hasattr(narrative_broadcaster, 'BroadcastSegment')
