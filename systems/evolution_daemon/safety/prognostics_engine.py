"""
Evolution Daemon V13 - Prognostics Engine

Predicts future RTS file health based on historical data.
Uses linear regression to forecast degradation trends.
"""

import logging
from datetime import datetime
from typing import Optional

import numpy as np
from sklearn.linear_model import LinearRegression

from .data_structures import HealthPrediction
from .prognostics_store import PrognosticsStore

logger = logging.getLogger("evolution_daemon.prognostics_engine")


class PrognosticsEngine:
    """Predicts RTS file health using machine learning."""

    def __init__(self, store: PrognosticsStore):
        self.store = store
        self.model: Optional[LinearRegression] = None
        self._training_samples = 0

    def train(self) -> bool:
        """Train the prediction model on historical data."""
        features, targets = self.store.get_training_data()

        if len(features) < 5:
            logger.warning("Not enough data to train model")
            return False

        X = np.array(features)
        y = np.array(targets)

        self.model = LinearRegression()
        self.model.fit(X, y)
        self._training_samples = len(features)

        logger.info(f"Trained model on {self._training_samples} samples")
        return True

    def predict(
        self,
        rts_path: str,
        file_size: int,
        modification_count: int,
        file_age_days: float,
        current_locality: float,
        current_entropy: float,
        horizon_hours: int = 24
    ) -> HealthPrediction:
        """Predict future health of an RTS file."""

        if self.model is None:
            # Return current state with zero confidence if no model
            return HealthPrediction(
                rts_path=rts_path,
                predicted_health_score=current_locality,
                confidence=0.0,
                predicted_at=datetime.now().isoformat(),
                horizon_hours=horizon_hours,
                recommended_action=None
            )

        # Prepare features
        X = np.array([[
            file_size,
            modification_count,
            file_age_days + horizon_hours / 24,  # Projected age
            current_locality,
            current_entropy
        ]])

        # Predict
        predicted_score = float(self.model.predict(X)[0])

        # Clamp to valid range
        predicted_score = max(0.0, min(1.0, predicted_score))

        # Calculate confidence based on training data size
        confidence = min(0.95, self._training_samples / 100)

        # Determine recommended action
        recommended_action = None
        if predicted_score < 0.5:
            recommended_action = "re_generate"
        elif predicted_score < 0.7:
            recommended_action = "defragment"

        return HealthPrediction(
            rts_path=rts_path,
            predicted_health_score=predicted_score,
            confidence=confidence,
            predicted_at=datetime.now().isoformat(),
            horizon_hours=horizon_hours,
            recommended_action=recommended_action
        )
