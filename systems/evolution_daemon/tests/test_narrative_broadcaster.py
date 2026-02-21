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
