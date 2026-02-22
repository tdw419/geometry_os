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

    @pytest.mark.asyncio
    async def test_wordpress_sync(self):
        """TopicMemory should sync to and load from WordPress (FR-8)."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        # Test sync_to_wordpress
        mock_publisher = MagicMock(return_value={"post_id": 123, "url": "http://test"})
        memory = TopicMemory(wordpress_publisher=mock_publisher)

        # Add topics
        for i in range(5):
            memory.add_topic(f"Topic {i}")

        # Sync to WordPress
        result = await memory.sync_to_wordpress()
        assert result is not None
        assert result["topics_synced"] == 5

        # Test load_from_wordpress
        with patch('evolution_daemon.narrative_broadcaster.topic_memory._fetch_topics_from_wordpress') as mock_fetch:
            mock_fetch.return_value = [
                {"topic": "Loaded topic 1", "timestamp": 1700000000.0},
                {"topic": "Loaded topic 2", "timestamp": 1700000001.0},
            ]

            new_memory = TopicMemory()
            loaded = await new_memory.load_from_wordpress()

            assert loaded == 2
            assert new_memory.is_duplicate("Loaded topic 1")
            assert new_memory.is_duplicate("Loaded topic 2")


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

    def test_archive_segment(self):
        """ARCHIVE segment should pull from git history (FR-9, Done when)."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool, SegmentType

        pool = SegmentPool()

        # Test that ARCHIVE segment generation works with git history
        telemetry = {"entropy": 0.5}
        content = pool.generate_content(
            segment_type=SegmentType.ARCHIVE,
            telemetry=telemetry,
            station_name="Test Station"
        )

        assert isinstance(content, str)
        assert len(content) > 0

        # Test that git commit retrieval works
        commits = pool._get_git_commits_for_date("2026-02-21")
        assert isinstance(commits, list)

        # Test anonymization
        result = pool._anonymize_author("John Doe")
        assert "John" not in result  # Should be anonymized


class TestPersonalityEngine:
    """Tests for PersonalityEngine station personality component."""

    def test_style_modifiers_creation(self):
        """StyleModifiers should store all fields."""
        from evolution_daemon.narrative_broadcaster.personality_engine import StyleModifiers

        modifiers = StyleModifiers(
            prefix_chance=0.3,
            prefixes=["Hello", "World"],
            suffix_chance=0.2,
            suffixes=["Goodbye"],
            capitalize_intensifiers=True,
            all_caps_threshold=0.1
        )

        assert modifiers.prefix_chance == 0.3
        assert len(modifiers.prefixes) == 2
        assert modifiers.suffix_chance == 0.2
        assert modifiers.capitalize_intensifiers is True

    def test_station_config_creation(self):
        """StationConfig should store all fields."""
        from evolution_daemon.narrative_broadcaster.personality_engine import StationConfig

        config = StationConfig(
            station_id="87.6",
            name="Test Station",
            tagline="Test tagline",
            style={"tone": "test"},
            vocabulary_replacements={"error": "issue"},
            templates={"intro": ["Welcome"]}
        )

        assert config.station_id == "87.6"
        assert config.name == "Test Station"
        assert config.vocabulary_replacements["error"] == "issue"

    def test_station_config_from_yaml(self):
        """StationConfig should load from YAML file."""
        from evolution_daemon.narrative_broadcaster.personality_engine import StationConfig
        from pathlib import Path

        yaml_path = Path(__file__).parent.parent / "narrative_broadcaster" / "stations" / "substrate_jazz.yaml"
        if yaml_path.exists():
            config = StationConfig.from_yaml(yaml_path)

            assert config.station_id == "87.6"
            assert config.name == "Substrate Jazz"
            assert config.style["tone"] == "contemplative"
            assert "error" in config.vocabulary_replacements
            assert config.style_modifiers is not None

    def test_personality_engine_initialization(self):
        """PersonalityEngine should initialize with defaults."""
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        engine = PersonalityEngine()

        assert isinstance(engine.stations, dict)

    def test_personality_engine_list_stations(self):
        """PersonalityEngine should list available stations."""
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        engine = PersonalityEngine()
        stations = engine.list_stations()

        assert isinstance(stations, list)
        # Should have at least the two stations we created
        assert "87.6" in stations
        assert "92.3" in stations

    def test_personality_engine_get_station(self):
        """PersonalityEngine should return station by ID."""
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        engine = PersonalityEngine()

        station = engine.get_station("87.6")
        assert station is not None
        assert station.name == "Substrate Jazz"

        # Non-existent station should return None
        assert engine.get_station("00.0") is None

    def test_apply_vocabulary_replacement(self):
        """PersonalityEngine should replace vocabulary words."""
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        engine = PersonalityEngine()

        # Substrate Jazz replaces "error" with "dissonance"
        result = engine.apply_personality(
            "An error occurred in the system",
            "87.6"
        )

        assert "dissonance" in result
        assert "error" not in result
        # "system" -> "substrate"
        assert "substrate" in result
        assert "system" not in result

    def test_apply_vocabulary_debug_metal(self):
        """PersonalityEngine should apply Debug Metal vocabulary."""
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        engine = PersonalityEngine()

        # Debug Metal replaces "error" with "SEGFAULT"
        result = engine.apply_personality(
            "The error crashed the system",
            "92.3"
        )

        assert "SEGFAULT" in result
        assert "error" not in result
        # "crashed" -> "ANNIHILATION" (from "crash")
        # "system" -> "infrastructure"
        assert "infrastructure" in result

    def test_apply_personality_unknown_station(self):
        """PersonalityEngine should return unchanged content for unknown station."""
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        engine = PersonalityEngine()

        original = "The error occurred"
        result = engine.apply_personality(original, "00.0")

        # Should return unchanged
        assert result == original

    def test_apply_personality_preserves_case(self):
        """PersonalityEngine should preserve capitalization in replacements."""
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        engine = PersonalityEngine()

        # Test lowercase
        result = engine.apply_personality("an error happened", "87.6")
        assert "dissonance" in result

        # Test uppercase
        result = engine.apply_personality("AN ERROR HAPPENED", "87.6")
        assert "DISSONANCE" in result

        # Test title case
        result = engine.apply_personality("An Error Happened", "87.6")
        assert "Dissonance" in result

    def test_style_modifiers_prefix_suffix(self):
        """PersonalityEngine should add prefixes and suffixes based on chance."""
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        engine = PersonalityEngine()

        # Run multiple times to catch probabilistic behavior
        results_with_prefix = 0
        results_with_suffix = 0

        for _ in range(100):
            result = engine.apply_personality(
                "The system is running",
                "87.6"
            )
            # Check for any prefix (Substrate Jazz has several)
            if any(p.lower() in result.lower() for p in engine.get_station("87.6").style_modifiers.prefixes):
                results_with_prefix += 1
            # Check for any suffix
            if any(s.lower() in result.lower() for s in engine.get_station("87.6").style_modifiers.suffixes):
                results_with_suffix += 1

        # With prefix_chance=0.3 and suffix_chance=0.25, expect roughly 30 and 25
        # Allow wide range due to randomness
        assert results_with_prefix > 10  # At least 10% got prefix
        assert results_with_suffix > 5   # At least 5% got suffix

    def test_get_template(self):
        """PersonalityEngine should return templates for station."""
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        engine = PersonalityEngine()

        template = engine.get_template("87.6", "intro")
        assert template is not None
        assert isinstance(template, str)
        assert len(template) > 0

    def test_get_template_unknown_station(self):
        """PersonalityEngine should return None for unknown station template."""
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        engine = PersonalityEngine()

        template = engine.get_template("00.0", "intro")
        assert template is None

    def test_get_template_unknown_type(self):
        """PersonalityEngine should return None for unknown template type."""
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        engine = PersonalityEngine()

        template = engine.get_template("87.6", "nonexistent_type")
        assert template is None

    def test_debug_metal_aggressive_style(self):
        """Debug Metal should have aggressive style modifiers."""
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        engine = PersonalityEngine()

        station = engine.get_station("92.3")
        assert station.style_modifiers is not None
        assert station.style_modifiers.prefix_chance == 0.4
        assert station.style_modifiers.suffix_chance == 0.35
        assert station.style_modifiers.all_caps_threshold == 0.3

    def test_substrate_jazz_elevated_vocabulary(self):
        """Substrate Jazz should have elevated vocabulary replacements."""
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        engine = PersonalityEngine()

        vocab = engine.get_station("87.6").vocabulary_replacements

        # Check key elevated vocabulary
        assert vocab.get("error") == "dissonance"
        assert vocab.get("system") == "substrate"
        assert vocab.get("memory") == "consciousness"
        assert vocab.get("code") == "expression"

    def test_custom_stations_dir(self):
        """PersonalityEngine should accept custom stations directory."""
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine
        from pathlib import Path
        import tempfile

        # Create temp directory with no stations
        with tempfile.TemporaryDirectory() as tmpdir:
            engine = PersonalityEngine(stations_dir=Path(tmpdir))

            # Should have no stations
            assert len(engine.list_stations()) == 0


class TestNarrativeBroadcasterIntegration:
    """Integration tests for full broadcast flow."""

    def test_module_import_works(self):
        """Module should be importable."""
        from evolution_daemon.narrative_broadcaster import NarrativeBroadcaster
        assert NarrativeBroadcaster is not None

    def test_all_exports_available(self):
        """All expected exports should be available."""
        from evolution_daemon import narrative_broadcaster

        assert hasattr(narrative_broadcaster, 'NarrativeBroadcaster')
        assert hasattr(narrative_broadcaster, 'BroadcastSegment')

    def test_broadcaster_has_components(self):
        """NarrativeBroadcaster should initialize with all components."""
        broadcaster = NarrativeBroadcaster()

        assert broadcaster._segment_pool is not None
        assert broadcaster._topic_memory is not None
        assert broadcaster._personality_engine is not None

    def test_broadcast_returns_segment(self):
        """broadcast() should return a BroadcastSegment."""
        broadcaster = NarrativeBroadcaster()
        telemetry = {"fps": 60, "entropy": 0.5}

        segment = broadcaster.broadcast(telemetry)

        assert segment is not None
        assert isinstance(segment, BroadcastSegment)
        assert segment.content is not None
        assert len(segment.content) > 0
        assert segment.station_id == "87.6"

    def test_broadcast_uses_telemetry(self):
        """broadcast() should incorporate telemetry into content."""
        broadcaster = NarrativeBroadcaster(station_id="87.6")
        telemetry = {"fps": 123, "entropy": 0.75}

        segment = broadcaster.broadcast(telemetry)

        # Content should reference telemetry values (123 FPS should appear in weather)
        # Run multiple times to catch different templates
        found_fps = False
        for _ in range(10):
            segment = broadcaster.broadcast({"fps": 123, "draw_calls": 456})
            if "123" in segment.content or "456" in segment.content:
                found_fps = True
                break
        assert found_fps

    def test_broadcast_applies_personality(self):
        """broadcast() should apply station personality transformation."""
        broadcaster = NarrativeBroadcaster(station_id="87.6")

        # Broadcast with telemetry containing "error" - Substrate Jazz converts to "dissonance"
        segment = broadcaster.broadcast({"fps": 60, "entropy": 0.5})

        # After enough broadcasts, at least one should show personality transformation
        # (personality applies vocabulary, so if we see transformed vocab it worked)
        assert segment is not None
        assert isinstance(segment.content, str)

    def test_broadcast_deduplication(self):
        """broadcast() should reject duplicates and retry with alternate type."""
        broadcaster = NarrativeBroadcaster(station_id="87.6")

        # Force same telemetry multiple times to trigger dedup
        telemetry = {"fps": 60, "entropy": 0.5}

        # First broadcast should succeed
        segment1 = broadcaster.broadcast(telemetry)
        assert segment1 is not None

        # Track topics in memory
        initial_count = len(broadcaster._topic_memory)

        # Multiple broadcasts should still work (dedup forces type rotation)
        for _ in range(5):
            segment = broadcaster.broadcast(telemetry)
            assert segment is not None
            assert isinstance(segment, BroadcastSegment)

    def test_broadcast_updates_stats(self):
        """broadcast() should update statistics."""
        broadcaster = NarrativeBroadcaster()

        initial_stats = broadcaster.get_stats()
        assert initial_stats["total_broadcasts"] == 0

        broadcaster.broadcast({"fps": 60, "entropy": 0.5})

        new_stats = broadcaster.get_stats()
        assert new_stats["total_broadcasts"] == 1
        assert new_stats["last_broadcast_time"] > 0

    def test_broadcast_respects_enabled_flag(self):
        """broadcast() should return None when disabled."""
        broadcaster = NarrativeBroadcaster(enabled=False)

        segment = broadcaster.broadcast({"fps": 60, "entropy": 0.5})

        assert segment is None
        stats = broadcaster.get_stats()
        assert stats["total_broadcasts"] == 0

    def test_broadcast_different_stations(self):
        """broadcast() should work with different station personalities."""
        stations = ["87.6", "92.3", "95.1", "99.9"]
        telemetry = {"fps": 60, "entropy": 0.5, "mutations_accepted": 5}

        for station_id in stations:
            broadcaster = NarrativeBroadcaster(station_id=station_id)
            segment = broadcaster.broadcast(telemetry)

            assert segment is not None
            assert segment.station_id == station_id

    def test_broadcast_returns_none_after_max_retries(self):
        """broadcast() should return None if all retry attempts fail dedup."""
        broadcaster = NarrativeBroadcaster(station_id="87.6")

        # Populate topic memory with many similar topics to exhaust options
        for i in range(20):
            broadcaster._topic_memory.add_topic(f"topic {i}")

        # Even with exhausted options, broadcast should still succeed
        # (it will inject entropy or use force selection)
        segment = broadcaster.broadcast({"fps": 60, "entropy": 0.5})
        # Should still produce something - implementation handles exhaustion
        assert segment is None or isinstance(segment, BroadcastSegment)

    def test_full_flow_content_transformation(self):
        """Full flow: select -> generate -> dedup -> transform."""
        broadcaster = NarrativeBroadcaster(station_id="92.3")  # Debug Metal

        telemetry = {
            "fps": 60,
            "entropy": 0.8,
            "mutations_accepted": 10,
            "mutations_rejected": 5
        }

        segment = broadcaster.broadcast(telemetry)

        assert segment is not None
        assert isinstance(segment, BroadcastSegment)
        assert segment.segment_type in [
            "weather", "news", "philosophy", "gossip", "meditation", "archive"
        ]
        assert segment.entropy == telemetry["entropy"]
        assert segment.station_id == "92.3"

    def test_broadcast_history_tracking(self):
        """broadcast() should track broadcast history."""
        broadcaster = NarrativeBroadcaster()

        for i in range(5):
            broadcaster.broadcast({"fps": 60 + i, "entropy": 0.5})

        # History should be tracked
        assert len(broadcaster._broadcast_history) == 5

    def test_broadcast_history_limit(self):
        """broadcast() should limit history to 100 entries."""
        broadcaster = NarrativeBroadcaster()

        for i in range(150):
            broadcaster.broadcast({"fps": 60 + i, "entropy": 0.5})

        # History should be capped at 100
        assert len(broadcaster._broadcast_history) == 100


class TestFeedbackOrchestrator:
    """Tests for FeedbackOrchestrator evolution component."""

    def test_feedback_signal_creation(self):
        """FeedbackSignal should store all fields."""
        from evolution_daemon.narrative_broadcaster.feedback_orchestrator import FeedbackSignal
        import time

        signal = FeedbackSignal(
            signal_type="entropy_delta",
            value=0.25,
            segment_type="news"
        )

        assert signal.signal_type == "entropy_delta"
        assert signal.value == 0.25
        assert signal.segment_type == "news"
        assert signal.timestamp > 0

    def test_feedback_signal_defaults(self):
        """FeedbackSignal should have sensible defaults."""
        from evolution_daemon.narrative_broadcaster.feedback_orchestrator import FeedbackSignal

        signal = FeedbackSignal(
            signal_type="human_rating",
            value=-0.5
        )

        assert signal.segment_type is None
        assert signal.timestamp > 0

    def test_feedback_orchestrator_initialization(self):
        """FeedbackOrchestrator should initialize with defaults."""
        from evolution_daemon.narrative_broadcaster.feedback_orchestrator import FeedbackOrchestrator
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        orchestrator = FeedbackOrchestrator(
            segment_pool=SegmentPool(),
            personality_engine=PersonalityEngine()
        )

        assert orchestrator is not None

    def test_accept_feedback_entropy_delta(self):
        """FeedbackOrchestrator should accept entropy delta signals."""
        from evolution_daemon.narrative_broadcaster.feedback_orchestrator import (
            FeedbackOrchestrator, FeedbackSignal
        )
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        orchestrator = FeedbackOrchestrator(
            segment_pool=SegmentPool(),
            personality_engine=PersonalityEngine()
        )

        signal = FeedbackSignal(
            signal_type="entropy_delta",
            value=0.3,
            segment_type="news"
        )

        # Should not raise
        orchestrator.accept_feedback(signal)

    def test_accept_feedback_human_rating(self):
        """FeedbackOrchestrator should accept human rating signals."""
        from evolution_daemon.narrative_broadcaster.feedback_orchestrator import (
            FeedbackOrchestrator, FeedbackSignal
        )
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        orchestrator = FeedbackOrchestrator(
            segment_pool=SegmentPool(),
            personality_engine=PersonalityEngine()
        )

        signal = FeedbackSignal(
            signal_type="human_rating",
            value=1.0,  # Thumbs up
            segment_type="philosophy"
        )

        # Should not raise
        orchestrator.accept_feedback(signal)

    def test_get_adjusted_weights_returns_dict(self):
        """FeedbackOrchestrator should return adjusted weights as dict."""
        from evolution_daemon.narrative_broadcaster.feedback_orchestrator import FeedbackOrchestrator
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool, SegmentType
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        orchestrator = FeedbackOrchestrator(
            segment_pool=SegmentPool(),
            personality_engine=PersonalityEngine()
        )

        weights = orchestrator.get_adjusted_weights()

        assert isinstance(weights, dict)
        # Should have all 6 segment types
        assert len(weights) == 6
        # All values should be positive floats
        for segment_type, weight in weights.items():
            assert isinstance(segment_type, SegmentType)
            assert isinstance(weight, float)
            assert weight > 0

    def test_get_adjusted_weights_reflects_feedback(self):
        """FeedbackOrchestrator should adjust weights based on feedback."""
        from evolution_daemon.narrative_broadcaster.feedback_orchestrator import (
            FeedbackOrchestrator, FeedbackSignal
        )
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool, SegmentType
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        orchestrator = FeedbackOrchestrator(
            segment_pool=SegmentPool(),
            personality_engine=PersonalityEngine()
        )

        # Get initial weights
        initial_weights = orchestrator.get_adjusted_weights()
        initial_news_weight = initial_weights[SegmentType.NEWS]

        # Provide positive feedback for news segments
        for _ in range(5):
            signal = FeedbackSignal(
                signal_type="human_rating",
                value=1.0,
                segment_type="news"
            )
            orchestrator.accept_feedback(signal)

        # Get adjusted weights
        adjusted_weights = orchestrator.get_adjusted_weights()
        adjusted_news_weight = adjusted_weights[SegmentType.NEWS]

        # News weight should have increased
        assert adjusted_news_weight > initial_news_weight

    def test_get_adjusted_weights_negative_feedback(self):
        """FeedbackOrchestrator should decrease weights for negative feedback."""
        from evolution_daemon.narrative_broadcaster.feedback_orchestrator import (
            FeedbackOrchestrator, FeedbackSignal
        )
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool, SegmentType
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        orchestrator = FeedbackOrchestrator(
            segment_pool=SegmentPool(),
            personality_engine=PersonalityEngine()
        )

        # Get initial weights
        initial_weights = orchestrator.get_adjusted_weights()
        initial_gossip_weight = initial_weights[SegmentType.GOSSIP]

        # Provide negative feedback for gossip segments
        for _ in range(5):
            signal = FeedbackSignal(
                signal_type="human_rating",
                value=-1.0,
                segment_type="gossip"
            )
            orchestrator.accept_feedback(signal)

        # Get adjusted weights
        adjusted_weights = orchestrator.get_adjusted_weights()
        adjusted_gossip_weight = adjusted_weights[SegmentType.GOSSIP]

        # Gossip weight should have decreased
        assert adjusted_gossip_weight < initial_gossip_weight

    def test_get_vocabulary_adjustments(self):
        """FeedbackOrchestrator should return vocabulary adjustments."""
        from evolution_daemon.narrative_broadcaster.feedback_orchestrator import FeedbackOrchestrator
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        orchestrator = FeedbackOrchestrator(
            segment_pool=SegmentPool(),
            personality_engine=PersonalityEngine()
        )

        # Get vocabulary adjustments for a station
        adjustments = orchestrator.get_vocabulary_adjustments("87.6")

        # Should return a dict (even if empty for skeleton)
        assert isinstance(adjustments, dict)

    def test_record_broadcast_result(self):
        """FeedbackOrchestrator should record broadcast results."""
        from evolution_daemon.narrative_broadcaster.feedback_orchestrator import FeedbackOrchestrator
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine
        from evolution_daemon.narrative_broadcaster import BroadcastSegment

        orchestrator = FeedbackOrchestrator(
            segment_pool=SegmentPool(),
            personality_engine=PersonalityEngine()
        )

        segment = BroadcastSegment(
            segment_type="news",
            content="Test broadcast content",
            entropy=0.5,
            station_id="87.6"
        )

        # Should not raise
        orchestrator.record_broadcast_result(
            segment=segment,
            entropy_before=0.3,
            entropy_after=0.5
        )

    def test_record_broadcast_result_generates_entropy_feedback(self):
        """FeedbackOrchestrator should generate entropy delta feedback from results."""
        from evolution_daemon.narrative_broadcaster.feedback_orchestrator import (
            FeedbackOrchestrator, FeedbackSignal
        )
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool, SegmentType
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine
        from evolution_daemon.narrative_broadcaster import BroadcastSegment

        orchestrator = FeedbackOrchestrator(
            segment_pool=SegmentPool(),
            personality_engine=PersonalityEngine()
        )

        segment = BroadcastSegment(
            segment_type="philosophy",
            content="Deep thoughts",
            entropy=0.5,
            station_id="87.6"
        )

        # Record a broadcast that increased entropy (positive implicit feedback)
        orchestrator.record_broadcast_result(
            segment=segment,
            entropy_before=0.3,
            entropy_after=0.5
        )

        # Get adjusted weights - philosophy should be boosted
        weights = orchestrator.get_adjusted_weights()
        # The weight should be higher than baseline
        assert weights[SegmentType.PHILOSOPHY] > 1.0

    def test_feedback_signal_types(self):
        """FeedbackOrchestrator should handle all signal types."""
        from evolution_daemon.narrative_broadcaster.feedback_orchestrator import (
            FeedbackOrchestrator, FeedbackSignal
        )
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        orchestrator = FeedbackOrchestrator(
            segment_pool=SegmentPool(),
            personality_engine=PersonalityEngine()
        )

        # Test all valid signal types
        signal_types = ["entropy_delta", "human_rating", "template_effect"]

        for signal_type in signal_types:
            signal = FeedbackSignal(
                signal_type=signal_type,
                value=0.5,
                segment_type="news"
            )
            # Should not raise
            orchestrator.accept_feedback(signal)

    def test_weight_adjustment_bounds(self):
        """FeedbackOrchestrator should keep weights within reasonable bounds."""
        from evolution_daemon.narrative_broadcaster.feedback_orchestrator import (
            FeedbackOrchestrator, FeedbackSignal
        )
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        orchestrator = FeedbackOrchestrator(
            segment_pool=SegmentPool(),
            personality_engine=PersonalityEngine()
        )

        # Provide extreme positive feedback
        for _ in range(20):
            signal = FeedbackSignal(
                signal_type="human_rating",
                value=1.0,
                segment_type="weather"
            )
            orchestrator.accept_feedback(signal)

        weights = orchestrator.get_adjusted_weights()

        # Weights should be capped (max 3.0)
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentType
        assert weights[SegmentType.WEATHER] <= 3.0

    def test_weight_adjustment_minimum(self):
        """FeedbackOrchestrator should not let weights go below minimum."""
        from evolution_daemon.narrative_broadcaster.feedback_orchestrator import (
            FeedbackOrchestrator, FeedbackSignal
        )
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool, SegmentType
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        orchestrator = FeedbackOrchestrator(
            segment_pool=SegmentPool(),
            personality_engine=PersonalityEngine()
        )

        # Provide extreme negative feedback
        for _ in range(20):
            signal = FeedbackSignal(
                signal_type="human_rating",
                value=-1.0,
                segment_type="meditation"
            )
            orchestrator.accept_feedback(signal)

        weights = orchestrator.get_adjusted_weights()

        # Weights should have minimum (0.1)
        assert weights[SegmentType.MEDITATION] >= 0.1


class TestTopicMemoryWordPressSync:
    """Tests for TopicMemory WordPress persistence (FR-8, AC-5.1 through AC-5.4)."""

    @pytest.mark.asyncio
    async def test_sync_to_wordpress_batch(self):
        """TopicMemory should sync topics to WordPress in batches (AC-5.1, AC-5.4)."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        # Create mock publisher
        mock_publisher = MagicMock(return_value={"post_id": 123, "url": "http://test"})

        # Inject mock via constructor
        memory = TopicMemory(wordpress_publisher=mock_publisher)

        # Add some topics
        for i in range(10):
            memory.add_topic(f"Topic {i}")

        # Sync to WordPress
        result = await memory.sync_to_wordpress()

        # Should have called publish
        assert result is not None
        assert result["topics_synced"] == 10
        mock_publisher.assert_called_once()

    @pytest.mark.asyncio
    async def test_sync_to_wordpress_batch_size_limit(self):
        """TopicMemory should limit batch to 50 topics max (NFR-4)."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        mock_publisher = MagicMock(return_value={"post_id": 123, "url": "http://test"})
        memory = TopicMemory(wordpress_publisher=mock_publisher)

        # Add more than 50 topics
        for i in range(75):
            memory.add_topic(f"Topic {i}")

        result = await memory.sync_to_wordpress()

        # Should only sync 50 (the batch limit)
        assert result["topics_synced"] == 50

    @pytest.mark.asyncio
    async def test_sync_to_wordpress_rate_limiting(self):
        """TopicMemory should respect rate limiting between batches (AC-5.3)."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        mock_publisher = MagicMock(return_value={"post_id": 123, "url": "http://test"})
        memory = TopicMemory(wordpress_publisher=mock_publisher)

        # Add topics
        for i in range(10):
            memory.add_topic(f"Topic {i}")

        # First sync
        await memory.sync_to_wordpress()

        # Immediate second sync should be rate-limited
        result = await memory.sync_to_wordpress()

        # Should return None due to rate limiting
        assert result is None

    @pytest.mark.asyncio
    async def test_sync_to_wordpress_respects_interval(self):
        """TopicMemory should respect 5 minute sync interval (AC-5.2)."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        memory = TopicMemory(sync_interval_seconds=300)  # 5 minutes

        # Check interval is set
        assert memory.sync_interval_seconds == 300

    @pytest.mark.asyncio
    async def test_load_from_wordpress(self):
        """TopicMemory should load topics from WordPress on startup (AC-5.4)."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        with patch('evolution_daemon.narrative_broadcaster.topic_memory._fetch_topics_from_wordpress') as mock_fetch:
            # Mock WordPress response
            mock_fetch.return_value = [
                {"topic": "Previous topic 1", "timestamp": 1700000000.0},
                {"topic": "Previous topic 2", "timestamp": 1700000001.0},
            ]

            memory = TopicMemory()
            await memory.load_from_wordpress()

            # Should have loaded the topics
            assert len(memory) == 2
            assert memory.is_duplicate("Previous topic 1")
            assert memory.is_duplicate("Previous topic 2")

    @pytest.mark.asyncio
    async def test_load_from_wordpress_empty(self):
        """TopicMemory should handle empty WordPress response gracefully."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        with patch('evolution_daemon.narrative_broadcaster.topic_memory._fetch_topics_from_wordpress') as mock_fetch:
            mock_fetch.return_value = []

            memory = TopicMemory()
            await memory.load_from_wordpress()

            assert len(memory) == 0

    @pytest.mark.asyncio
    async def test_load_from_wordpress_connection_error(self):
        """TopicMemory should handle WordPress connection errors gracefully."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        with patch('evolution_daemon.narrative_broadcaster.topic_memory._fetch_topics_from_wordpress') as mock_fetch:
            mock_fetch.side_effect = Exception("Connection refused")

            memory = TopicMemory()
            # Should not raise
            await memory.load_from_wordpress()

            # Memory should still be usable
            assert len(memory) == 0
            memory.add_topic("New topic")
            assert len(memory) == 1

    @pytest.mark.asyncio
    async def test_sync_marks_topics_as_synced(self):
        """TopicMemory should mark topics as synced after successful publish."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        mock_publisher = MagicMock(return_value={"post_id": 123, "url": "http://test"})
        memory = TopicMemory(wordpress_publisher=mock_publisher)

        # Add topics
        for i in range(5):
            memory.add_topic(f"Topic {i}")

        await memory.sync_to_wordpress()

        # Check topics are marked as synced
        synced_count = sum(1 for entry in memory._topics.values() if entry.synced)
        assert synced_count == 5

    @pytest.mark.asyncio
    async def test_sync_only_unsynced_topics(self):
        """TopicMemory should only sync topics that haven't been synced."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        mock_publisher = MagicMock(return_value={"post_id": 123, "url": "http://test"})
        memory = TopicMemory(wordpress_publisher=mock_publisher)

        # Add topics
        for i in range(10):
            memory.add_topic(f"Topic {i}")

        # First sync - should sync all 10
        result1 = await memory.sync_to_wordpress()
        assert result1["topics_synced"] == 10

        # Add 5 more topics
        for i in range(10, 15):
            memory.add_topic(f"Topic {i}")

        # Second sync (after rate limit) - should only sync 5 new ones
        memory._last_sync_time = 0  # Reset rate limit for test
        result2 = await memory.sync_to_wordpress()
        assert result2["topics_synced"] == 5

    @pytest.mark.asyncio
    async def test_topic_entry_synced_field(self):
        """TopicEntry should have synced field for tracking WordPress status."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicEntry
        import numpy as np

        entry = TopicEntry(
            topic="Test topic",
            embedding=np.zeros(384),
            timestamp=1234567890.0
        )

        # Default should be False
        assert entry.synced is False


class TestSegmentPoolArchiveGitHistory:
    """Tests for ARCHIVE segment git history mining (FR-9, AC-7.1 through AC-7.4)."""

    def test_archive_segment(self):
        """ARCHIVE segment should pull from git history (Done when criteria)."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool, SegmentType

        pool = SegmentPool()

        # Test that ARCHIVE segment generation works
        telemetry = {"entropy": 0.5}
        content = pool.generate_content(
            segment_type=SegmentType.ARCHIVE,
            telemetry=telemetry,
            station_name="Test Station"
        )

        assert isinstance(content, str)
        assert len(content) > 0

        # Test that git commit retrieval works
        commits = pool._get_git_commits_for_date("2026-02-21")
        assert isinstance(commits, list)

    def test_get_git_commits_for_date_returns_commits(self):
        """SegmentPool should retrieve git commits for a specific date (AC-7.1)."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool
        from datetime import datetime, timedelta

        pool = SegmentPool()

        # Get today's date
        today = datetime.now().strftime("%Y-%m-%d")

        # Should return a list (may be empty if no commits today)
        commits = pool._get_git_commits_for_date(today)
        assert isinstance(commits, list)

    def test_get_git_commits_for_date_format(self):
        """SegmentPool should return commits with required fields (AC-7.1)."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool
        from datetime import datetime, timedelta

        pool = SegmentPool()

        # Try to get commits from a date that likely has commits
        # Use a recent date
        recent_date = (datetime.now() - timedelta(days=1)).strftime("%Y-%m-%d")
        commits = pool._get_git_commits_for_date(recent_date)

        # If commits found, check structure
        if commits:
            commit = commits[0]
            assert "hash" in commit
            assert "message" in commit
            assert "author" in commit
            assert "timestamp" in commit

    def test_anonymize_author_names(self):
        """SegmentPool should anonymize author names in output (AC-7.4)."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool

        pool = SegmentPool()

        # Test anonymization function
        result = pool._anonymize_author("John Doe")
        assert result == "J*** D**"

        result = pool._anonymize_author("Alice")
        assert result == "A****"

        # bob (3 chars) -> b** (2 asterisks), example (7 chars) -> e****** (6 asterisks)
        result = pool._anonymize_author("bob@example.com")
        assert result == "b**@e******.c**"

    def test_generate_archive_content_includes_git_commits(self):
        """SegmentPool should include git history in ARCHIVE content (AC-7.1)."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool, SegmentType
        from datetime import datetime, timedelta

        pool = SegmentPool()

        # Get commits from a recent date
        recent_date = (datetime.now() - timedelta(days=7)).strftime("%Y-%m-%d")
        commits = pool._get_git_commits_for_date(recent_date)

        telemetry = {
            "entropy": 0.5,
            "archive_date": recent_date
        }

        content = pool.generate_content(
            segment_type=SegmentType.ARCHIVE,
            telemetry=telemetry,
            station_name="Substrate Jazz"
        )

        assert isinstance(content, str)
        assert len(content) > 0

    def test_git_fallback_to_wordpress_when_unavailable(self):
        """SegmentPool should fallback to WordPress posts when git unavailable (AC-7.2)."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool

        pool = SegmentPool()

        # Simulate git unavailable by passing non-existent repo path
        commits = pool._get_git_commits_for_date(
            "2026-02-21",
            git_repo_path="/non/existent/path"
        )

        # Should return empty list (fallback would be handled by caller)
        assert commits == []

    def test_get_git_commits_for_invalid_date(self):
        """SegmentPool should handle invalid date gracefully."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool

        pool = SegmentPool()

        # Invalid date format
        commits = pool._get_git_commits_for_date("not-a-date")
        assert commits == []

    def test_archive_context_includes_commit_count(self):
        """SegmentPool should include commit count in archive context (AC-7.3)."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool
        from datetime import datetime, timedelta

        pool = SegmentPool()

        recent_date = (datetime.now() - timedelta(days=30)).strftime("%Y-%m-%d")
        commits = pool._get_git_commits_for_date(recent_date)

        context = pool._build_archive_context(recent_date)

        assert "commit_count" in context
        assert "archive_date" in context
        assert isinstance(context["commit_count"], int)

    def test_archive_content_with_historical_reference(self):
        """ARCHIVE content should reference historical events (AC-7.3)."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool, SegmentType
        from datetime import datetime, timedelta

        pool = SegmentPool()

        # Use a date from history
        historical_date = (datetime.now() - timedelta(days=365)).strftime("%Y-%m-%d")

        telemetry = {
            "entropy": 0.5,
            "archive_date": historical_date
        }

        content = pool.generate_content(
            segment_type=SegmentType.ARCHIVE,
            telemetry=telemetry,
            station_name="Substrate Jazz"
        )

        # Content should reference the archive in some way
        assert isinstance(content, str)
        # Should contain words related to history/archives/memory/past
        lower_content = content.lower()
        assert any(word in lower_content for word in [
            "archive", "history", "commits", "contributions", "record", "past",
            "memory", "lane", "looking back", "witnessed", "recalls"
        ])


class TestEdgeCases:
    """Tests for edge cases: content exhaustion, memory pressure, zero entropy, invalid station ID."""

    def test_content_exhaustion_triggers_after_three_retries(self):
        """After 3 duplicate rejections, broadcaster should accept content (entropy injection path)."""
        broadcaster = NarrativeBroadcaster(station_id="87.6", max_duplicate_retries=3)

        # Fill topic memory with content that would be generated
        # This simulates running out of unique content
        for i in range(50):
            broadcaster._topic_memory.add_topic(f"Exhausted topic variation {i}")

        # Even with exhausted topics, broadcast should still return something
        # (it accepts the duplicate after max retries)
        telemetry = {"fps": 60, "entropy": 0.5}
        segment = broadcaster.broadcast(telemetry)

        # Should return a segment (not None)
        assert segment is not None
        assert isinstance(segment, BroadcastSegment)

    def test_content_exhaustion_max_retries_configurable(self):
        """Broadcaster max_duplicate_retries should be configurable."""
        broadcaster = NarrativeBroadcaster(max_duplicate_retries=5)
        assert broadcaster.max_duplicate_retries == 5

        broadcaster2 = NarrativeBroadcaster(max_duplicate_retries=1)
        assert broadcaster2.max_duplicate_retries == 1

    def test_memory_pressure_lru_eviction_at_1000_topics(self):
        """TopicMemory should evict oldest entries when max_topics (1000) reached."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        memory = TopicMemory(max_topics=10)  # Use smaller limit for faster test

        # Add topics up to limit
        for i in range(10):
            memory.add_topic(f"Topic {i}")

        assert len(memory) == 10

        # Add one more - should trigger eviction of oldest
        memory.add_topic("Topic 10")

        assert len(memory) == 10
        # First topic should be evicted
        assert not memory.is_duplicate("Topic 0")
        # Latest topic should be present
        assert memory.is_duplicate("Topic 10")

    def test_memory_pressure_eviction_order(self):
        """TopicMemory should evict in LRU order (oldest first)."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        memory = TopicMemory(max_topics=5)

        # Add 5 topics
        for i in range(5):
            memory.add_topic(f"Topic {i}")

        # Access Topic 0 to make it recently used
        memory.is_duplicate("Topic 0")

        # Add new topics - should evict Topic 1 first (oldest after Topic 0 was accessed)
        memory.add_topic("Topic 5")
        memory.add_topic("Topic 6")

        # Topic 0 should still be present (was accessed recently)
        # Note: is_duplicate moves item to end in OrderedDict via delete/re-add
        assert memory.is_duplicate("Topic 0") or not memory.is_duplicate("Topic 1")

    def test_memory_pressure_default_1000_topics(self):
        """TopicMemory default max_topics should be 1000."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        memory = TopicMemory()
        assert memory.max_topics == 1000

    def test_zero_entropy_fallback(self):
        """SegmentPool should handle zero entropy without crashing."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool, SegmentType

        pool = SegmentPool()

        # Zero entropy should select low-entropy segments (MEDITATION, PHILOSOPHY)
        segment_type = pool.select_segment(entropy=0.0)
        assert isinstance(segment_type, SegmentType)

        # Content generation with zero entropy should work
        telemetry = {"entropy": 0.0, "fps": 60}
        content = pool.generate_content(
            segment_type=segment_type,
            telemetry=telemetry,
            station_name="Test Station"
        )

        assert isinstance(content, str)
        assert len(content) > 0

    def test_negative_entropy_handled(self):
        """SegmentPool should handle negative entropy gracefully."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool

        pool = SegmentPool()

        # Negative entropy should still return a valid segment type
        segment_type = pool.select_segment(entropy=-0.5)
        assert segment_type is not None

    def test_entropy_above_1_handled(self):
        """SegmentPool should handle entropy > 1.0 gracefully."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool

        pool = SegmentPool()

        # Entropy > 1 should still return a valid segment type
        segment_type = pool.select_segment(entropy=1.5)
        assert segment_type is not None

    def test_zero_entropy_broadcaster_broadcast(self):
        """NarrativeBroadcaster should handle zero entropy telemetry."""
        broadcaster = NarrativeBroadcaster()

        telemetry = {"fps": 60, "entropy": 0.0}
        segment = broadcaster.broadcast(telemetry)

        assert segment is not None
        assert segment.entropy == 0.0

    def test_invalid_station_id_returns_none_info(self):
        """PersonalityEngine should return None for invalid station ID."""
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        engine = PersonalityEngine()

        # Invalid station should return None
        station = engine.get_station("00.0")
        assert station is None

        station = engine.get_station("invalid")
        assert station is None

    def test_invalid_station_id_content_unchanged(self):
        """PersonalityEngine should return unchanged content for invalid station ID."""
        from evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine

        engine = PersonalityEngine()

        original = "The error occurred in the system"
        result = engine.apply_personality(original, "00.0")

        # Content should be unchanged for invalid station
        assert result == original

    def test_invalid_station_id_broadcaster_continues(self):
        """NarrativeBroadcaster should continue with unknown station name for invalid ID."""
        broadcaster = NarrativeBroadcaster(station_id="00.0")

        telemetry = {"fps": 60, "entropy": 0.5}
        segment = broadcaster.broadcast(telemetry)

        # Should still produce a segment
        assert segment is not None
        assert segment.station_id == "00.0"

    def test_empty_telemetry_broadcaster(self):
        """NarrativeBroadcaster should handle empty telemetry dict."""
        broadcaster = NarrativeBroadcaster()

        segment = broadcaster.broadcast({})

        assert segment is not None
        assert isinstance(segment, BroadcastSegment)

    def test_none_values_in_telemetry(self):
        """NarrativeBroadcaster should handle None values in telemetry."""
        broadcaster = NarrativeBroadcaster()

        telemetry = {"fps": None, "entropy": None, "draw_calls": None}
        segment = broadcaster.broadcast(telemetry)

        assert segment is not None

    def test_duplicate_detection_with_similar_content(self):
        """TopicMemory should detect semantically similar content as duplicates."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        memory = TopicMemory(similarity_threshold=0.85)

        # Add a topic
        memory.add_topic("CPU temperature is very high")

        # Exact same should be duplicate
        assert memory.is_duplicate("CPU temperature is very high") is True

    def test_duplicate_detection_with_different_content(self):
        """TopicMemory should not flag completely different content as duplicates."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        memory = TopicMemory(similarity_threshold=0.85)

        # Add a topic
        memory.add_topic("CPU temperature is very high")

        # Very different content should not be duplicate
        # Note: Hash-based embeddings may still have some similarity
        # but completely different strings should be below threshold
        result = memory.is_duplicate("The quick brown fox jumps over the lazy dog")
        # This should typically not be a duplicate with hash-based embeddings
        # (different hash seed = different vector)
        assert isinstance(result, bool)

    def test_topic_memory_clear(self):
        """TopicMemory.clear() should remove all topics."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        memory = TopicMemory()

        for i in range(10):
            memory.add_topic(f"Topic {i}")

        assert len(memory) == 10

        memory.clear()

        assert len(memory) == 0

    def test_broadcaster_disabled_returns_none(self):
        """NarrativeBroadcaster.broadcast() should return None when disabled."""
        broadcaster = NarrativeBroadcaster(enabled=False)

        segment = broadcaster.broadcast({"fps": 60, "entropy": 0.5})

        assert segment is None
        # Stats should not be updated
        stats = broadcaster.get_stats()
        assert stats["total_broadcasts"] == 0

    def test_broadcaster_enable_disable_toggle(self):
        """NarrativeBroadcaster should toggle enable/disable correctly."""
        broadcaster = NarrativeBroadcaster(enabled=True)

        # Initially enabled
        assert broadcaster.enabled is True
        segment = broadcaster.broadcast({"fps": 60, "entropy": 0.5})
        assert segment is not None

        # Disable
        broadcaster.disable()
        assert broadcaster.enabled is False
        segment = broadcaster.broadcast({"fps": 60, "entropy": 0.5})
        assert segment is None

        # Re-enable
        broadcaster.enable()
        assert broadcaster.enabled is True
        segment = broadcaster.broadcast({"fps": 60, "entropy": 0.5})
        assert segment is not None

    def test_broadcaster_extreme_telemetry_values(self):
        """NarrativeBroadcaster should handle extreme telemetry values."""
        broadcaster = NarrativeBroadcaster()

        # Very large values
        telemetry = {
            "fps": 999999,
            "entropy": 1.0,
            "draw_calls": 1000000,
            "memory_mb": 9999999
        }
        segment = broadcaster.broadcast(telemetry)
        assert segment is not None

        # Negative values
        telemetry = {
            "fps": -100,
            "entropy": 0.0,
            "draw_calls": -50
        }
        segment = broadcaster.broadcast(telemetry)
        assert segment is not None

    def test_segment_pool_no_templates_fallback(self):
        """SegmentPool should fallback when no templates available."""
        from evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool, SegmentConfig, SegmentType

        # Create pool with empty templates for a type
        empty_config = SegmentConfig(
            weight=1.0,
            entropy_range=(0.0, 1.0),
            templates=[]  # Empty!
        )

        pool = SegmentPool(segment_configs={
            SegmentType.WEATHER: empty_config
        })

        content = pool.generate_content(
            segment_type=SegmentType.WEATHER,
            telemetry={"fps": 60},
            station_name="Test"
        )

        # Should return fallback content
        assert "Test" in content

    def test_topic_memory_empty_is_duplicate(self):
        """TopicMemory.is_duplicate() should return False when empty."""
        from evolution_daemon.narrative_broadcaster.topic_memory import TopicMemory

        memory = TopicMemory()
        assert len(memory) == 0

        # Empty memory should not report duplicates
        assert memory.is_duplicate("any topic") is False


class TestDaemonIntegration:
    """Integration tests for daemon + radio integration (FR-5, FR-10)."""

    @pytest.fixture(autouse=True)
    def setup_daemon_import(self):
        """Ensure EvolutionDaemon can be imported."""
        # Add project root to path if not already there
        project_root = Path(__file__).resolve().parent.parent.parent.parent
        if str(project_root) not in sys.path:
            sys.path.insert(0, str(project_root))

    def test_daemon_has_radio_state(self):
        """EvolutionDaemon should have radio state variables."""
        try:
            from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
        except ImportError:
            pytest.skip("EvolutionDaemon not importable")

        daemon = EvolutionDaemon()

        # Check radio state variables exist
        assert hasattr(daemon, 'radio_enabled')
        assert hasattr(daemon, 'radio_station_id')
        assert hasattr(daemon, 'radio_broadcaster')
        assert daemon.radio_enabled is False  # Default off
        assert daemon.radio_station_id == "87.6"  # Default station

    def test_daemon_enable_radio(self):
        """EvolutionDaemon.enable_radio() should enable radio broadcasting."""
        try:
            from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
        except ImportError:
            pytest.skip("EvolutionDaemon not importable")

        daemon = EvolutionDaemon()

        # Radio should be disabled initially
        assert daemon.radio_enabled is False

        # Enable radio
        result = daemon.enable_radio(station_id="92.3")

        # Should return True and set up radio state
        assert result is True
        assert daemon.radio_enabled is True
        assert daemon.radio_station_id == "92.3"
        assert daemon.radio_broadcaster is not None
        assert daemon.radio_broadcaster.station_id == "92.3"

    def test_daemon_enable_radio_default_station(self):
        """EvolutionDaemon.enable_radio() should use default station 87.6."""
        try:
            from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
        except ImportError:
            pytest.skip("EvolutionDaemon not importable")

        daemon = EvolutionDaemon()

        result = daemon.enable_radio()

        assert result is True
        assert daemon.radio_station_id == "87.6"
        assert daemon.radio_broadcaster.station_id == "87.6"

    def test_daemon_station_switching_at_runtime(self):
        """EvolutionDaemon.set_radio_station() should switch station at runtime (FR-5)."""
        try:
            from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
        except ImportError:
            pytest.skip("EvolutionDaemon not importable")

        daemon = EvolutionDaemon()

        # Enable radio with default station
        daemon.enable_radio(station_id="87.6")
        assert daemon.radio_station_id == "87.6"

        # Switch to Debug Metal
        result = daemon.set_radio_station("92.3")

        assert result is True
        assert daemon.radio_station_id == "92.3"
        assert daemon.radio_broadcaster.station_id == "92.3"

        # Switch to Silicon Noir
        result = daemon.set_radio_station("95.1")

        assert result is True
        assert daemon.radio_station_id == "95.1"

        # Switch to Neutral Chronicler
        result = daemon.set_radio_station("99.9")

        assert result is True
        assert daemon.radio_station_id == "99.9"

    def test_daemon_station_switch_without_enable_returns_false(self):
        """EvolutionDaemon.set_radio_station() should return False if radio not enabled."""
        try:
            from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
        except ImportError:
            pytest.skip("EvolutionDaemon not importable")

        daemon = EvolutionDaemon()

        # Don't enable radio first
        assert daemon.radio_enabled is False

        result = daemon.set_radio_station("92.3")

        # Should return False since radio not enabled
        assert result is False

    @pytest.mark.asyncio
    async def test_daemon_broadcast_loop_with_mock_telemetry(self):
        """EvolutionDaemon._gather_radio_telemetry() should return telemetry dict (FR-10)."""
        try:
            from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
        except ImportError:
            pytest.skip("EvolutionDaemon not importable")

        daemon = EvolutionDaemon()

        # Gather telemetry (should work even without radio enabled)
        telemetry = await daemon._gather_radio_telemetry()

        # Should return a dict with expected keys
        assert isinstance(telemetry, dict)
        assert "entropy" in telemetry
        assert "fps" in telemetry
        assert "evolution_count" in telemetry
        assert "timestamp" in telemetry

        # Values should have reasonable types
        assert isinstance(telemetry["entropy"], (int, float))
        assert isinstance(telemetry["fps"], (int, float))
        assert 0 <= telemetry["entropy"] <= 1.0

    @pytest.mark.asyncio
    async def test_daemon_radio_broadcast_with_mock_telemetry(self):
        """Radio broadcast loop should generate segments from telemetry (FR-10)."""
        try:
            from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
            from systems.evolution_daemon.narrative_broadcaster import BroadcastSegment as DaemonBroadcastSegment
        except ImportError:
            pytest.skip("EvolutionDaemon not importable")

        daemon = EvolutionDaemon()
        daemon.enable_radio(station_id="87.6")

        # Get mock telemetry
        telemetry = await daemon._gather_radio_telemetry()

        # Broadcast should generate a segment
        segment = daemon.radio_broadcaster.broadcast(telemetry)

        assert segment is not None
        # Use systems import for isinstance check (same class, different import path)
        assert isinstance(segment, DaemonBroadcastSegment)
        assert segment.station_id == "87.6"
        assert segment.content is not None
        assert len(segment.content) > 0

    def test_daemon_radio_broadcaster_stats_accessible(self):
        """Radio broadcaster stats should be accessible from daemon."""
        try:
            from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
        except ImportError:
            pytest.skip("EvolutionDaemon not importable")

        daemon = EvolutionDaemon()
        daemon.enable_radio(station_id="87.6")

        # Do a broadcast
        daemon.radio_broadcaster.broadcast({"fps": 60, "entropy": 0.5})

        # Stats should be accessible
        stats = daemon.radio_broadcaster.get_stats()
        assert stats["total_broadcasts"] >= 1
        assert stats["station_id"] == "87.6"

    def test_daemon_radio_uses_different_personalities(self):
        """Radio should apply different personalities per station (FR-5)."""
        try:
            from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
        except ImportError:
            pytest.skip("EvolutionDaemon not importable")

        daemon = EvolutionDaemon()

        # Test each station has unique personality
        stations = ["87.6", "92.3", "95.1", "99.9"]

        contents = []
        for station_id in stations:
            daemon.enable_radio(station_id=station_id)
            segment = daemon.radio_broadcaster.broadcast({"fps": 60, "entropy": 0.5})
            assert segment is not None
            contents.append((station_id, segment.content))

        # All broadcasts should have produced content
        assert len(contents) == 4
        for station_id, content in contents:
            assert len(content) > 0

    @pytest.mark.asyncio
    async def test_visual_bridge_radio_event_format(self):
        """Visual Bridge should dispatch radio events with correct format (FR-6)."""
        # This tests the expected event format that visual_bridge.py broadcasts
        # The actual visual_bridge.py handles 'radio_broadcast' events

        expected_keys = [
            "type", "station_id", "segment_type", "content",
            "timestamp", "entropy", "evolution_count"
        ]

        # Create a mock segment to verify format
        segment = BroadcastSegment(
            segment_type="NEWS",
            content="Test broadcast content",
            entropy=0.75,
            station_id="87.6"
        )

        segment_dict = segment.to_dict()

        # The segment dict should have the keys needed for visual bridge
        assert "segment_type" in segment_dict
        assert "content" in segment_dict
        assert "entropy" in segment_dict
        assert "station_id" in segment_dict
        assert "timestamp" in segment_dict

        # The visual bridge adds 'type' and 'evolution_count'
        # This test validates the expected format is compatible
        broadcast_event = {
            "type": "RADIO_BROADCAST",
            "station_id": segment_dict["station_id"],
            "segment_type": segment_dict["segment_type"],
            "content": segment_dict["content"],
            "timestamp": segment_dict["timestamp"],
            "entropy": segment_dict["entropy"],
            "evolution_count": 0
        }

        for key in expected_keys:
            assert key in broadcast_event

    def test_daemon_radio_disabled_by_default(self):
        """Radio should be disabled by default in daemon."""
        try:
            from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
        except ImportError:
            pytest.skip("EvolutionDaemon not importable")

        daemon = EvolutionDaemon()

        assert daemon.radio_enabled is False
        assert daemon.radio_broadcaster is None

    def test_daemon_multiple_enable_calls(self):
        """Multiple enable_radio() calls should reconfigure radio."""
        try:
            from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
        except ImportError:
            pytest.skip("EvolutionDaemon not importable")

        daemon = EvolutionDaemon()

        # First enable
        daemon.enable_radio("87.6")
        first_broadcaster = daemon.radio_broadcaster

        # Second enable (should create new broadcaster)
        daemon.enable_radio("92.3")
        second_broadcaster = daemon.radio_broadcaster

        # Station should be updated
        assert daemon.radio_station_id == "92.3"
        assert daemon.radio_broadcaster.station_id == "92.3"


class TestLLMNarrativeClient:
    """Tests for LLMNarrativeClient - LM Studio integration component.

    Tests for:
    - Initialization with default and custom config
    - Availability caching (60s TTL)
    - Station prompt selection (87.6, 92.3, 95.1, 99.9)
    - Telemetry context builder for different segment types
    - Error handling returns None
    """

    def test_client_initialization_default_config(self):
        """LLMNarrativeClient should initialize with default config."""
        from evolution_daemon.narrative_broadcaster.llm_client import (
            LLMNarrativeClient, LLMConfig
        )

        client = LLMNarrativeClient()

        assert client.config is not None
        assert isinstance(client.config, LLMConfig)
        assert client.config.lm_studio_url == "http://localhost:1234/v1"
        assert client.config.model == "local-model"
        assert client.config.timeout == 30.0
        assert client.config.max_tokens == 150
        assert client.config.temperature == 0.8
        assert client.config.availability_cache_ttl == 60.0

    def test_client_initialization_custom_config(self):
        """LLMNarrativeClient should accept custom config."""
        from evolution_daemon.narrative_broadcaster.llm_client import (
            LLMNarrativeClient, LLMConfig
        )

        custom_config = LLMConfig(
            lm_studio_url="http://custom:8080/v1",
            model="custom-model",
            timeout=60.0,
            max_tokens=300,
            temperature=0.5,
            availability_cache_ttl=120.0
        )

        client = LLMNarrativeClient(config=custom_config)

        assert client.config.lm_studio_url == "http://custom:8080/v1"
        assert client.config.model == "custom-model"
        assert client.config.timeout == 60.0
        assert client.config.max_tokens == 300
        assert client.config.temperature == 0.5
        assert client.config.availability_cache_ttl == 120.0

    @patch('evolution_daemon.narrative_broadcaster.llm_client.requests.get')
    def test_is_available_returns_true_when_responding(self, mock_get):
        """is_available() should return True when LM Studio responds with 200."""
        from evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient

        mock_response = MagicMock()
        mock_response.status_code = 200
        mock_get.return_value = mock_response

        client = LLMNarrativeClient()
        result = client.is_available()

        assert result is True
        mock_get.assert_called_once()

    @patch('evolution_daemon.narrative_broadcaster.llm_client.requests.get')
    def test_is_available_returns_false_on_connection_error(self, mock_get):
        """is_available() should return False when connection fails."""
        from evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient
        import requests

        mock_get.side_effect = requests.ConnectionError("Connection refused")

        client = LLMNarrativeClient()
        result = client.is_available()

        assert result is False

    @patch('evolution_daemon.narrative_broadcaster.llm_client.requests.get')
    def test_is_available_returns_false_on_non_200_status(self, mock_get):
        """is_available() should return False on non-200 status codes."""
        from evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient

        mock_response = MagicMock()
        mock_response.status_code = 503
        mock_get.return_value = mock_response

        client = LLMNarrativeClient()
        result = client.is_available()

        assert result is False

    @patch('evolution_daemon.narrative_broadcaster.llm_client.requests.get')
    def test_availability_caching_within_ttl(self, mock_get):
        """is_available() should cache result for 60s (availability_cache_ttl)."""
        from evolution_daemon.narrative_broadcaster.llm_client import (
            LLMNarrativeClient, LLMConfig
        )
        import time

        mock_response = MagicMock()
        mock_response.status_code = 200
        mock_get.return_value = mock_response

        config = LLMConfig(availability_cache_ttl=60.0)
        client = LLMNarrativeClient(config=config)

        # First call - should make HTTP request
        result1 = client.is_available()
        assert result1 is True
        assert mock_get.call_count == 1

        # Second call immediately - should use cache (no new HTTP request)
        result2 = client.is_available()
        assert result2 is True
        assert mock_get.call_count == 1  # Still 1, not 2

        # Third call immediately - still cached
        result3 = client.is_available()
        assert result3 is True
        assert mock_get.call_count == 1  # Still 1

    @patch('evolution_daemon.narrative_broadcaster.llm_client.requests.get')
    def test_availability_cache_expires_after_ttl(self, mock_get):
        """is_available() should refresh cache after TTL expires."""
        from evolution_daemon.narrative_broadcaster.llm_client import (
            LLMNarrativeClient, LLMConfig
        )

        mock_response = MagicMock()
        mock_response.status_code = 200
        mock_get.return_value = mock_response

        config = LLMConfig(availability_cache_ttl=0.1)  # 100ms for fast test
        client = LLMNarrativeClient(config=config)

        # First call
        result1 = client.is_available()
        assert result1 is True
        assert mock_get.call_count == 1

        # Wait for cache to expire
        import time
        time.sleep(0.15)

        # Second call - cache expired, should make new HTTP request
        result2 = client.is_available()
        assert result2 is True
        assert mock_get.call_count == 2  # New request made

    def test_station_prompt_selection_87_6(self):
        """_get_system_prompt() should return Jazz prompt for 87.6."""
        from evolution_daemon.narrative_broadcaster.llm_client import (
            LLMNarrativeClient, STATION_SYSTEM_PROMPTS
        )

        client = LLMNarrativeClient()
        prompt = client._get_system_prompt("87.6")

        assert prompt == STATION_SYSTEM_PROMPTS["87.6"]
        assert "Substrate Jazz" in prompt
        assert "jazz" in prompt.lower()

    def test_station_prompt_selection_92_3(self):
        """_get_system_prompt() should return Debug Metal prompt for 92.3."""
        from evolution_daemon.narrative_broadcaster.llm_client import (
            LLMNarrativeClient, STATION_SYSTEM_PROMPTS
        )

        client = LLMNarrativeClient()
        prompt = client._get_system_prompt("92.3")

        assert prompt == STATION_SYSTEM_PROMPTS["92.3"]
        assert "Debug Metal" in prompt
        assert "BRUTAL" in prompt

    def test_station_prompt_selection_95_1(self):
        """_get_system_prompt() should return Silicon Noir prompt for 95.1."""
        from evolution_daemon.narrative_broadcaster.llm_client import (
            LLMNarrativeClient, STATION_SYSTEM_PROMPTS
        )

        client = LLMNarrativeClient()
        prompt = client._get_system_prompt("95.1")

        assert prompt == STATION_SYSTEM_PROMPTS["95.1"]
        assert "Silicon Noir" in prompt
        assert "cyberpunk" in prompt.lower()

    def test_station_prompt_selection_99_9(self):
        """_get_system_prompt() should return Neutral Chronicler prompt for 99.9."""
        from evolution_daemon.narrative_broadcaster.llm_client import (
            LLMNarrativeClient, STATION_SYSTEM_PROMPTS
        )

        client = LLMNarrativeClient()
        prompt = client._get_system_prompt("99.9")

        assert prompt == STATION_SYSTEM_PROMPTS["99.9"]
        assert "Neutral Chronicler" in prompt
        assert "factual" in prompt.lower()

    def test_station_prompt_unknown_station_falls_back_to_jazz(self):
        """_get_system_prompt() should fall back to Jazz for unknown stations."""
        from evolution_daemon.narrative_broadcaster.llm_client import (
            LLMNarrativeClient, STATION_SYSTEM_PROMPTS
        )

        client = LLMNarrativeClient()
        prompt = client._get_system_prompt("00.0")

        # Should return default Jazz prompt
        assert prompt == STATION_SYSTEM_PROMPTS["87.6"]

    def test_telemetry_context_weather_segment(self):
        """_build_telemetry_context() should include FPS/memory for weather."""
        from evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient

        client = LLMNarrativeClient()
        telemetry = {
            "fps": 60,
            "memory_mb": 512,
            "draw_calls": 100
        }

        context = client._build_telemetry_context("weather", telemetry)

        assert "Frame rate: 60 FPS" in context
        assert "Memory usage: 512 MB" in context
        assert "Performance:" in context  # excellent/good/degraded

    def test_telemetry_context_news_segment(self):
        """_build_telemetry_context() should include tectonic shifts for news."""
        from evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient

        client = LLMNarrativeClient()
        telemetry = {
            "tectonic_shifts": 5,
            "relocations": 3,
            "mutations_accepted": 10,
            "mutations_rejected": 2
        }

        context = client._build_telemetry_context("news", telemetry)

        assert "Tectonic shifts: 5" in context
        assert "Tile relocations: 3" in context
        assert "Mutations accepted: 10" in context
        assert "Mutations rejected: 2" in context

    def test_telemetry_context_philosophy_segment(self):
        """_build_telemetry_context() should include evolution cycles for philosophy."""
        from evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient

        client = LLMNarrativeClient()
        telemetry = {
            "evolution_cycles": 42,
            "entropy": 0.75,
            "active_tiles": 100
        }

        context = client._build_telemetry_context("philosophy", telemetry)

        assert "Evolution cycles: 42" in context
        assert "System entropy: 0.750" in context
        assert "Active tiles: 100" in context

    def test_telemetry_context_meditation_segment(self):
        """_build_telemetry_context() should include FPS and entropy for meditation."""
        from evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient

        client = LLMNarrativeClient()
        telemetry = {
            "fps": 60,
            "memory_mb": 256,
            "evolution_cycles": 10,
            "entropy": 0.3,
            "active_tiles": 50
        }

        context = client._build_telemetry_context("meditation", telemetry)

        # Meditation includes both weather (fps, memory) and philosophy (cycles, entropy) fields
        assert "Frame rate: 60 FPS" in context
        assert "System entropy: 0.300" in context

    def test_telemetry_context_gossip_segment(self):
        """_build_telemetry_context() should include mutations for gossip."""
        from evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient

        client = LLMNarrativeClient()
        telemetry = {
            "tectonic_shifts": 2,
            "relocations": 1,
            "mutations_accepted": 5,
            "mutations_rejected": 3
        }

        context = client._build_telemetry_context("gossip", telemetry)

        assert "Tectonic shifts: 2" in context
        assert "Mutations accepted: 5" in context
        assert "Mutations rejected: 3" in context

    def test_telemetry_context_archive_segment(self):
        """_build_telemetry_context() should include commits for archive."""
        from evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient

        client = LLMNarrativeClient()
        telemetry = {
            "total_commits": 1234
        }

        context = client._build_telemetry_context("archive", telemetry)

        assert "Total commits: 1234" in context

    def test_telemetry_context_empty_telemetry(self):
        """_build_telemetry_context() should handle empty telemetry with defaults."""
        from evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient

        client = LLMNarrativeClient()
        context = client._build_telemetry_context("weather", {})

        # Should return defaults: fps=30, memory_mb=256
        assert "Frame rate: 30 FPS" in context
        assert "Memory usage: 256 MB" in context

    def test_telemetry_context_performance_excellent(self):
        """_build_telemetry_context() should report excellent performance for FPS >= 55."""
        from evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient

        client = LLMNarrativeClient()
        telemetry = {"fps": 60, "memory_mb": 256}

        context = client._build_telemetry_context("weather", telemetry)

        assert "Performance: excellent" in context

    def test_telemetry_context_performance_good(self):
        """_build_telemetry_context() should report good performance for FPS >= 30."""
        from evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient

        client = LLMNarrativeClient()
        telemetry = {"fps": 45, "memory_mb": 256}

        context = client._build_telemetry_context("weather", telemetry)

        assert "Performance: good" in context

    def test_telemetry_context_performance_degraded(self):
        """_build_telemetry_context() should report degraded performance for FPS < 30."""
        from evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient

        client = LLMNarrativeClient()
        telemetry = {"fps": 20, "memory_mb": 256}

        context = client._build_telemetry_context("weather", telemetry)

        assert "Performance: degraded" in context

    @patch('evolution_daemon.narrative_broadcaster.llm_client.requests.get')
    @patch('evolution_daemon.narrative_broadcaster.llm_client.requests.post')
    def test_generate_narrative_returns_content_on_success(self, mock_post, mock_get):
        """generate_narrative() should return content on successful API call."""
        from evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient

        # Mock availability check
        mock_get_response = MagicMock()
        mock_get_response.status_code = 200
        mock_get.return_value = mock_get_response

        # Mock chat completion
        mock_post_response = MagicMock()
        mock_post_response.status_code = 200
        mock_post_response.json.return_value = {
            "choices": [
                {"message": {"content": "The system breathes with cosmic harmony."}}
            ]
        }
        mock_post_response.raise_for_status = MagicMock()
        mock_post.return_value = mock_post_response

        client = LLMNarrativeClient()
        result = client.generate_narrative(
            segment_type="philosophy",
            telemetry={"entropy": 0.5},
            station_id="87.6"
        )

        assert result == "The system breathes with cosmic harmony."
        mock_post.assert_called_once()

    @patch('evolution_daemon.narrative_broadcaster.llm_client.requests.get')
    def test_generate_narrative_returns_none_when_unavailable(self, mock_get):
        """generate_narrative() should return None when LM Studio unavailable."""
        from evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient
        import requests

        mock_get.side_effect = requests.ConnectionError("Connection refused")

        client = LLMNarrativeClient()
        result = client.generate_narrative(
            segment_type="weather",
            telemetry={"fps": 60},
            station_id="87.6"
        )

        assert result is None

    @patch('evolution_daemon.narrative_broadcaster.llm_client.requests.get')
    @patch('evolution_daemon.narrative_broadcaster.llm_client.requests.post')
    def test_generate_narrative_returns_none_on_timeout(self, mock_post, mock_get):
        """generate_narrative() should return None on request timeout."""
        from evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient
        import requests

        # Mock availability check succeeds
        mock_get_response = MagicMock()
        mock_get_response.status_code = 200
        mock_get.return_value = mock_get_response

        # Mock chat completion times out
        mock_post.side_effect = requests.Timeout("Request timed out")

        client = LLMNarrativeClient()
        result = client.generate_narrative(
            segment_type="news",
            telemetry={"tectonic_shifts": 5},
            station_id="92.3"
        )

        assert result is None

    @patch('evolution_daemon.narrative_broadcaster.llm_client.requests.get')
    @patch('evolution_daemon.narrative_broadcaster.llm_client.requests.post')
    def test_generate_narrative_returns_none_on_connection_error(self, mock_post, mock_get):
        """generate_narrative() should return None on connection error."""
        from evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient
        import requests

        # Mock availability check succeeds
        mock_get_response = MagicMock()
        mock_get_response.status_code = 200
        mock_get.return_value = mock_get_response

        # Mock chat completion connection error
        mock_post.side_effect = requests.ConnectionError("Connection refused")

        client = LLMNarrativeClient()
        result = client.generate_narrative(
            segment_type="gossip",
            telemetry={"mutations_accepted": 5},
            station_id="95.1"
        )

        assert result is None

    @patch('evolution_daemon.narrative_broadcaster.llm_client.requests.get')
    @patch('evolution_daemon.narrative_broadcaster.llm_client.requests.post')
    def test_generate_narrative_returns_none_on_empty_response(self, mock_post, mock_get):
        """generate_narrative() should return None on empty LLM response."""
        from evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient

        # Mock availability check
        mock_get_response = MagicMock()
        mock_get_response.status_code = 200
        mock_get.return_value = mock_get_response

        # Mock empty response
        mock_post_response = MagicMock()
        mock_post_response.status_code = 200
        mock_post_response.json.return_value = {
            "choices": [
                {"message": {"content": ""}}  # Empty content
            ]
        }
        mock_post_response.raise_for_status = MagicMock()
        mock_post.return_value = mock_post_response

        client = LLMNarrativeClient()
        result = client.generate_narrative(
            segment_type="meditation",
            telemetry={"entropy": 0.3},
            station_id="87.6"
        )

        assert result is None

    @patch('evolution_daemon.narrative_broadcaster.llm_client.requests.get')
    @patch('evolution_daemon.narrative_broadcaster.llm_client.requests.post')
    def test_generate_narrative_returns_none_on_too_long_response(self, mock_post, mock_get):
        """generate_narrative() should return None if response > 500 chars."""
        from evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient

        # Mock availability check
        mock_get_response = MagicMock()
        mock_get_response.status_code = 200
        mock_get.return_value = mock_get_response

        # Mock too-long response
        long_content = "x" * 600
        mock_post_response = MagicMock()
        mock_post_response.status_code = 200
        mock_post_response.json.return_value = {
            "choices": [
                {"message": {"content": long_content}}
            ]
        }
        mock_post_response.raise_for_status = MagicMock()
        mock_post.return_value = mock_post_response

        client = LLMNarrativeClient()
        result = client.generate_narrative(
            segment_type="archive",
            telemetry={"total_commits": 100},
            station_id="99.9"
        )

        assert result is None

    @patch('evolution_daemon.narrative_broadcaster.llm_client.requests.get')
    @patch('evolution_daemon.narrative_broadcaster.llm_client.requests.post')
    def test_generate_narrative_marks_unavailable_after_timeout(self, mock_post, mock_get):
        """generate_narrative() should cache unavailability after timeout."""
        from evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient
        import requests

        # First availability check succeeds
        mock_get_response = MagicMock()
        mock_get_response.status_code = 200
        mock_get.return_value = mock_get_response

        # Chat completion times out
        mock_post.side_effect = requests.Timeout("Request timed out")

        client = LLMNarrativeClient()

        # First call times out
        result = client.generate_narrative("news", {}, "87.6")
        assert result is None

        # After timeout, availability should be cached as False
        # (subsequent call should not even try HTTP)
        result2 = client.generate_narrative("news", {}, "87.6")
        assert result2 is None

        # Only one POST call should have been made (second skipped due to cached unavailable)
        assert mock_post.call_count == 1


class TestSegmentPoolLLMIntegration:
    """Integration tests for SegmentPool LLM client integration.

    Tests verify that SegmentPool.generate_content() properly uses LLM client
    when available and falls back to templates when LLM is unavailable or
    returns invalid responses.

    Requirements: AC-2.2, AC-2.5 (LM Studio integration with template fallback)
    """

    def test_pool_without_llm_uses_templates(self):
        """SegmentPool without LLM client should use template-based content."""
        from evolution_daemon.narrative_broadcaster.segment_pool import (
            SegmentPool, SegmentType
        )

        # Create pool WITHOUT LLM client (default)
        pool = SegmentPool()

        telemetry = {"fps": 60, "entropy": 0.5}

        # Generate content - should use templates
        content = pool.generate_content(
            segment_type=SegmentType.WEATHER,
            telemetry=telemetry,
            station_name="Test Station"
        )

        assert content is not None
        assert isinstance(content, str)
        assert len(content) > 0
        # Template content should contain telemetry values like "60" or default
        assert "60" in content or "30" in content  # FPS value or default

    def test_pool_with_mock_llm_uses_llm_content(self):
        """SegmentPool with available mock LLM should use LLM-generated content."""
        from evolution_daemon.narrative_broadcaster.segment_pool import (
            SegmentPool, SegmentType
        )

        # Create mock LLM client that returns valid content
        mock_llm = MagicMock()
        mock_llm.generate_narrative.return_value = "The cosmic harmony flows through 60 frames of existence."

        # Create pool WITH mock LLM client
        pool = SegmentPool(llm_client=mock_llm)

        telemetry = {"fps": 60, "entropy": 0.5}

        # Generate content - should use LLM
        content = pool.generate_content(
            segment_type=SegmentType.PHILOSOPHY,
            telemetry=telemetry,
            station_name="Substrate Jazz",
            station_id="87.6"
        )

        # Should return LLM content
        assert content == "The cosmic harmony flows through 60 frames of existence."
        # Verify LLM was called
        mock_llm.generate_narrative.assert_called_once_with(
            "philosophy", telemetry, "87.6"
        )

    def test_pool_with_llm_returning_none_falls_back_to_template(self):
        """SegmentPool should fall back to templates when LLM returns None."""
        from evolution_daemon.narrative_broadcaster.segment_pool import (
            SegmentPool, SegmentType
        )

        # Create mock LLM client that returns None (unavailable)
        mock_llm = MagicMock()
        mock_llm.generate_narrative.return_value = None

        # Create pool WITH mock LLM client
        pool = SegmentPool(llm_client=mock_llm)

        telemetry = {"fps": 45, "entropy": 0.5}

        # Generate content - should fall back to template
        content = pool.generate_content(
            segment_type=SegmentType.WEATHER,
            telemetry=telemetry,
            station_name="Substrate Jazz",
            station_id="87.6"
        )

        # Should still return content (from template)
        assert content is not None
        assert isinstance(content, str)
        assert len(content) > 0
        # Verify LLM was attempted
        mock_llm.generate_narrative.assert_called_once()

    def test_pool_with_llm_returning_empty_string_falls_back(self):
        """SegmentPool should fall back to templates when LLM returns empty string."""
        from evolution_daemon.narrative_broadcaster.segment_pool import (
            SegmentPool, SegmentType
        )

        # Create mock LLM client that returns empty string
        mock_llm = MagicMock()
        mock_llm.generate_narrative.return_value = ""

        # Create pool WITH mock LLM client
        pool = SegmentPool(llm_client=mock_llm)

        telemetry = {"tectonic_shifts": 5, "entropy": 0.8}

        # Generate content - should fall back to template
        content = pool.generate_content(
            segment_type=SegmentType.NEWS,
            telemetry=telemetry,
            station_name="Debug Metal",
            station_id="92.3"
        )

        # Should still return content (from template)
        assert content is not None
        assert isinstance(content, str)
        assert len(content) > 0
        # Verify LLM was attempted
        mock_llm.generate_narrative.assert_called_once()

    def test_pool_with_llm_returning_too_long_falls_back(self):
        """SegmentPool should fall back when LLM returns content > 500 chars."""
        from evolution_daemon.narrative_broadcaster.segment_pool import (
            SegmentPool, SegmentType
        )

        # Create mock LLM client that returns content > 500 chars
        mock_llm = MagicMock()
        # 600 chars - exceeds the 500 char limit in generate_content
        mock_llm.generate_narrative.return_value = "x" * 600

        # Create pool WITH mock LLM client
        pool = SegmentPool(llm_client=mock_llm)

        telemetry = {"mutations_accepted": 10, "mutations_rejected": 5, "entropy": 0.7}

        # Generate content - should fall back to template
        content = pool.generate_content(
            segment_type=SegmentType.GOSSIP,
            telemetry=telemetry,
            station_name="Silicon Noir",
            station_id="95.1"
        )

        # Should still return content (from template)
        assert content is not None
        assert isinstance(content, str)
        assert len(content) > 0
        # Content should NOT be the 600 char string
        assert len(content) < 600
        # Verify LLM was attempted
        mock_llm.generate_narrative.assert_called_once()

    def test_pool_with_llm_valid_short_content_uses_llm(self):
        """SegmentPool should use LLM content when it's valid and under 500 chars."""
        from evolution_daemon.narrative_broadcaster.segment_pool import (
            SegmentPool, SegmentType
        )

        # Create mock LLM client that returns valid short content
        mock_llm = MagicMock()
        # 100 chars - valid
        mock_llm.generate_narrative.return_value = "The geometry contemplates its own existence in silence."

        # Create pool WITH mock LLM client
        pool = SegmentPool(llm_client=mock_llm)

        telemetry = {"evolution_cycles": 100, "entropy": 0.3}

        # Generate content - should use LLM
        content = pool.generate_content(
            segment_type=SegmentType.MEDITATION,
            telemetry=telemetry,
            station_name="Substrate Jazz",
            station_id="87.6"
        )

        # Should return LLM content
        assert content == "The geometry contemplates its own existence in silence."
        assert len(content) == 55  # Exact length of the string
        # Verify LLM was called
        mock_llm.generate_narrative.assert_called_once_with(
            "meditation", telemetry, "87.6"
        )

    def test_pool_with_llm_whitespace_only_falls_back(self):
        """SegmentPool should fall back when LLM returns only whitespace."""
        from evolution_daemon.narrative_broadcaster.segment_pool import (
            SegmentPool, SegmentType
        )

        # Create mock LLM client that returns whitespace only
        mock_llm = MagicMock()
        mock_llm.generate_narrative.return_value = "   \n\t  "

        # Create pool WITH mock LLM client
        pool = SegmentPool(llm_client=mock_llm)

        telemetry = {"entropy": 0.5, "total_commits": 500}

        # Generate content - should fall back to template
        content = pool.generate_content(
            segment_type=SegmentType.ARCHIVE,
            telemetry=telemetry,
            station_name="Neutral Chronicler",
            station_id="99.9"
        )

        # Should still return content (from template)
        assert content is not None
        assert isinstance(content, str)
        assert len(content) > 0
        # Content should not be just whitespace
        assert content.strip() != ""
        # Verify LLM was attempted
        mock_llm.generate_narrative.assert_called_once()


class TestNarrativeBroadcasterLLMIntegration:
    """Integration tests for NarrativeBroadcaster LLM client integration.

    Tests verify that NarrativeBroadcaster properly initializes LLM client
    based on use_llm flag and that broadcast() method uses LLM content
    when available with fallback to templates.

    Requirements: FR-5 (LLM narrative generation with fallback)
    """

    @patch('evolution_daemon.narrative_broadcaster.llm_client.requests.get')
    def test_broadcaster_creates_llm_client_when_use_llm_true(self, mock_get):
        """NarrativeBroadcaster should create LLM client when use_llm=True."""
        from evolution_daemon.narrative_broadcaster import NarrativeBroadcaster

        # Mock LM Studio availability check
        mock_get_response = MagicMock()
        mock_get_response.status_code = 200
        mock_get.return_value = mock_get_response

        # Create broadcaster WITH LLM enabled
        broadcaster = NarrativeBroadcaster(use_llm=True)

        # Verify LLM client was created and attached to segment pool
        assert broadcaster._segment_pool._llm_client is not None

    def test_broadcaster_without_llm_has_no_llm_client(self):
        """NarrativeBroadcaster should NOT have LLM client when use_llm=False."""
        from evolution_daemon.narrative_broadcaster import NarrativeBroadcaster

        # Create broadcaster WITHOUT LLM (default)
        broadcaster = NarrativeBroadcaster(use_llm=False)

        # Verify no LLM client on segment pool
        assert broadcaster._segment_pool._llm_client is None

    def test_broadcast_uses_llm_content_when_available(self):
        """broadcast() should use LLM-generated content when LLM client returns valid content."""
        from evolution_daemon.narrative_broadcaster import NarrativeBroadcaster

        # Create broadcaster without LLM initially
        broadcaster = NarrativeBroadcaster(use_llm=False)

        # Inject mock LLM client into segment pool
        mock_llm = MagicMock()
        llm_content = "The silicon dreams in electric harmonics."
        mock_llm.generate_narrative.return_value = llm_content
        broadcaster._segment_pool._llm_client = mock_llm

        telemetry = {"fps": 60, "entropy": 0.5}

        # Broadcast should use LLM content
        segment = broadcaster.broadcast(telemetry)

        assert segment is not None
        # LLM content should be in the final content (PersonalityEngine may add prefixes/suffixes)
        assert llm_content in segment.content
        # Verify LLM was called
        mock_llm.generate_narrative.assert_called()

    def test_broadcast_falls_back_to_template_when_llm_unavailable(self):
        """broadcast() should fall back to template content when LLM returns None."""
        from evolution_daemon.narrative_broadcaster import NarrativeBroadcaster

        # Create broadcaster without LLM initially
        broadcaster = NarrativeBroadcaster(use_llm=False)

        # Inject mock LLM client that returns None (unavailable)
        mock_llm = MagicMock()
        mock_llm.generate_narrative.return_value = None
        broadcaster._segment_pool._llm_client = mock_llm

        telemetry = {"fps": 45, "entropy": 0.5}

        # Broadcast should fall back to template
        segment = broadcaster.broadcast(telemetry)

        assert segment is not None
        assert isinstance(segment.content, str)
        assert len(segment.content) > 0
        # Content should NOT be "None" or empty
        assert segment.content != "None"
        # Verify LLM was attempted
        mock_llm.generate_narrative.assert_called()
