"""
Evolution Daemon V13 - Prognostics Engine Tests

Tests for predictive RTS health modeling.
"""
import pytest
import tempfile
import os
import numpy as np

from systems.evolution_daemon.safety.prognostics_store import PrognosticsStore
from systems.evolution_daemon.safety.prognostics_engine import PrognosticsEngine
from systems.evolution_daemon.safety.data_structures import HealthPrediction


class TestPrognosticsEngine:
    @pytest.fixture
    def engine(self):
        with tempfile.TemporaryDirectory() as tmpdir:
            db_path = os.path.join(tmpdir, "test_prognostics.db")
            store = PrognosticsStore(db_path)
            yield PrognosticsEngine(store)

    @pytest.fixture
    def engine_with_data(self, engine):
        # Add training data with a clear trend
        for i in range(20):
            engine.store.log_integrity_check(
                rts_path="/test/file.rts.png",
                file_size=4096,
                modification_count=i,
                file_age_days=10.0 + i,
                hilbert_locality=1.0 - i * 0.03,  # Declining locality
                mean_entropy=7.0
            )
        return engine

    def test_engine_initializes(self, engine):
        assert engine is not None
        assert engine.model is None  # Not trained yet

    def test_train_model(self, engine_with_data):
        engine_with_data.train()
        assert engine_with_data.model is not None

    def test_predict_returns_prediction(self, engine_with_data):
        engine_with_data.train()
        prediction = engine_with_data.predict(
            rts_path="/test/file.rts.png",
            file_size=4096,
            modification_count=25,
            file_age_days=35.0,
            current_locality=0.4,
            current_entropy=7.0
        )
        assert isinstance(prediction, HealthPrediction)
        assert prediction.rts_path == "/test/file.rts.png"
        assert 0.0 <= prediction.predicted_health_score <= 1.0

    def test_predict_without_training_returns_default(self, engine):
        prediction = engine.predict(
            rts_path="/test/file.rts.png",
            file_size=4096,
            modification_count=5,
            file_age_days=10.0,
            current_locality=0.9,
            current_entropy=7.0
        )
        # Should return current locality when no model
        assert prediction.predicted_health_score == 0.9
        assert prediction.confidence == 0.0

    def test_get_recommended_action_low_locality(self, engine_with_data):
        engine_with_data.train()
        prediction = engine_with_data.predict(
            rts_path="/test/file.rts.png",
            file_size=4096,
            modification_count=25,
            file_age_days=35.0,
            current_locality=0.3,
            current_entropy=7.0
        )
        # Low predicted locality should recommend some action
        if prediction.predicted_health_score < 0.5:
            # Very low scores recommend regeneration
            assert prediction.recommended_action == "re_generate"
        elif prediction.predicted_health_score < 0.7:
            # Moderate low scores recommend defragmentation
            assert prediction.recommended_action == "defragment"
