import pytest
import tempfile
import os
from datetime import datetime

from systems.evolution_daemon.safety.prognostics_store import PrognosticsStore


class TestPrognosticsStore:
    @pytest.fixture
    def store(self):
        with tempfile.TemporaryDirectory() as tmpdir:
            db_path = os.path.join(tmpdir, "test_prognostics.db")
            yield PrognosticsStore(db_path)

    def test_store_initializes_database(self, store):
        assert store is not None

    def test_log_integrity_check(self, store):
        store.log_integrity_check(
            rts_path="/test/file.rts.png",
            file_size=4096,
            modification_count=5,
            file_age_days=10.5,
            hilbert_locality=0.95,
            mean_entropy=7.2
        )
        history = store.get_history("/test/file.rts.png")
        assert len(history) == 1
        assert history[0]["hilbert_locality"] == 0.95

    def test_get_history_returns_empty_for_unknown_file(self, store):
        history = store.get_history("/nonexistent/file.rts.png")
        assert history == []

    def test_get_all_recent_data(self, store):
        # Log multiple checks
        for i in range(3):
            store.log_integrity_check(
                rts_path=f"/test/file{i}.rts.png",
                file_size=4096,
                modification_count=i,
                file_age_days=10.0 + i,
                hilbert_locality=0.9 - i * 0.1,
                mean_entropy=7.0
            )
        data = store.get_all_recent_data(hours=24)
        assert len(data) == 3

    def test_get_training_data(self, store):
        # Log data for training
        for i in range(10):
            store.log_integrity_check(
                rts_path="/test/file.rts.png",
                file_size=4096,
                modification_count=i,
                file_age_days=float(i),
                hilbert_locality=1.0 - i * 0.05,
                mean_entropy=7.0
            )
        features, targets = store.get_training_data()
        assert len(features) == 9  # n-1 pairs for prediction
        assert len(targets) == 9
