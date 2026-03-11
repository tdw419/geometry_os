"""Tests for TraumaLog - Genetic Trauma recording system."""

import json
import tempfile
from pathlib import Path

import pytest

from systems.evolution_daemon.safety.trauma_log import GeneticTrauma, TraumaLog


class TestGeneticTrauma:
    """Tests for GeneticTrauma dataclass."""

    def test_genetic_trauma_creation(self):
        """Test creating a GeneticTrauma record."""
        trauma = GeneticTrauma(
            proposal_id="test-001",
            timestamp=1234567890.0,
            reflex_score=0.85,
            target_files=["file1.py", "file2.py"],
            diff_summary="Added new function",
            fracture_signal="EMERGENCY_FREEZE"
        )
        assert trauma.proposal_id == "test-001"
        assert trauma.timestamp == 1234567890.0
        assert trauma.reflex_score == 0.85
        assert trauma.target_files == ["file1.py", "file2.py"]
        assert trauma.diff_summary == "Added new function"
        assert trauma.fracture_signal == "EMERGENCY_FREEZE"
        assert trauma.dream_frame_id is None

    def test_genetic_trauma_with_dream_frame(self):
        """Test GeneticTrauma with optional dream_frame_id."""
        trauma = GeneticTrauma(
            proposal_id="test-002",
            timestamp=1234567890.0,
            reflex_score=0.5,
            target_files=["shader.wgsl"],
            diff_summary="Modified shader",
            fracture_signal="MEMORY_OVERFLOW",
            dream_frame_id="frame-123"
        )
        assert trauma.dream_frame_id == "frame-123"


class TestTraumaLog:
    """Tests for TraumaLog class."""

    @pytest.fixture
    def temp_project_root(self, tmp_path):
        """Create a temporary project root."""
        return tmp_path

    @pytest.fixture
    def trauma_log(self, temp_project_root):
        """Create a TraumaLog with temporary path."""
        return TraumaLog(project_root=temp_project_root)

    def test_trauma_log_initialization(self, trauma_log, temp_project_root):
        """Test TraumaLog initializes correctly."""
        assert trauma_log.project_root == temp_project_root
        assert trauma_log.log_path == temp_project_root / ".loop" / "genetic_trauma.jsonl"

    def test_trauma_log_creates_directory(self, temp_project_root):
        """Test TraumaLog creates .loop directory."""
        TraumaLog(project_root=temp_project_root)
        assert (temp_project_root / ".loop").exists()

    def test_record_trauma(self, trauma_log):
        """Test recording a trauma entry."""
        trauma = GeneticTrauma(
            proposal_id="test-001",
            timestamp=1234567890.0,
            reflex_score=0.85,
            target_files=["file1.py"],
            diff_summary="Test diff",
            fracture_signal="TEST_SIGNAL"
        )
        trauma_log.record_trauma(trauma)

        # Verify file exists and contains the trauma
        assert trauma_log.log_path.exists()
        content = trauma_log.log_path.read_text()
        data = json.loads(content.strip())
        assert data["proposal_id"] == "test-001"
        assert data["reflex_score"] == 0.85

    def test_record_multiple_traumas(self, trauma_log):
        """Test recording multiple trauma entries."""
        for i in range(3):
            trauma = GeneticTrauma(
                proposal_id=f"test-{i:03d}",
                timestamp=1234567890.0 + i,
                reflex_score=0.5 + i * 0.1,
                target_files=[f"file{i}.py"],
                diff_summary=f"Diff {i}",
                fracture_signal=f"SIGNAL_{i}"
            )
            trauma_log.record_trauma(trauma)

        # Verify all entries recorded
        traumas = trauma_log.get_recent_trauma()
        assert len(traumas) == 3

    def test_get_recent_trauma_empty(self, trauma_log):
        """Test get_recent_trauma when log doesn't exist."""
        traumas = trauma_log.get_recent_trauma()
        assert traumas == []

    def test_get_recent_trauma_with_data(self, trauma_log):
        """Test get_recent_trauma retrieves entries."""
        # Record some traumas
        for i in range(5):
            trauma = GeneticTrauma(
                proposal_id=f"test-{i:03d}",
                timestamp=1234567890.0 + i,
                reflex_score=0.5,
                target_files=["file.py"],
                diff_summary=f"Diff {i}",
                fracture_signal="SIGNAL"
            )
            trauma_log.record_trauma(trauma)

        traumas = trauma_log.get_recent_trauma(limit=3)
        assert len(traumas) == 3
        # Should get the last 3
        assert traumas[0].proposal_id == "test-002"
        assert traumas[2].proposal_id == "test-004"

    def test_get_recent_trauma_malformed_line(self, trauma_log):
        """Test get_recent_trauma handles malformed JSON."""
        # Write valid and invalid entries
        with open(trauma_log.log_path, "w") as f:
            f.write("invalid json\n")
            f.write(json.dumps({
                "proposal_id": "valid",
                "timestamp": 1234567890.0,
                "reflex_score": 0.5,
                "target_files": ["file.py"],
                "diff_summary": "Valid",
                "fracture_signal": "SIGNAL"
            }) + "\n")

        traumas = trauma_log.get_recent_trauma()
        assert len(traumas) == 1
        assert traumas[0].proposal_id == "valid"

    def test_trauma_log_default_project_root(self):
        """Test TraumaLog uses cwd as default project root."""
        log = TraumaLog()
        assert log.project_root == Path.cwd()
