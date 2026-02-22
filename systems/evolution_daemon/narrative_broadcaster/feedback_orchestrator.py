"""
FeedbackOrchestrator - Evolution integration for GOSR Radio

Adjusts broadcast parameters based on feedback signals.
"""

import time
from dataclasses import dataclass, field
from typing import Dict, Any, Optional, List
from collections import defaultdict

from .segment_pool import SegmentType


# Constants for weight adjustment
MIN_WEIGHT = 0.1
MAX_WEIGHT = 3.0
DEFAULT_WEIGHT = 1.0
FEEDBACK_IMPACT = 0.1  # How much each feedback affects weight


@dataclass
class FeedbackSignal:
    """
    Represents a feedback signal for the radio evolution.

    Attributes:
        signal_type: Type of feedback (entropy_delta, human_rating, template_effect).
        value: Feedback value from -1.0 to 1.0 (negative = bad, positive = good).
        segment_type: The segment type this feedback applies to (optional).
        timestamp: When the feedback was generated.
    """
    signal_type: str  # entropy_delta, human_rating, template_effect
    value: float  # -1.0 to 1.0
    segment_type: Optional[str] = None
    timestamp: float = field(default_factory=time.time)


class FeedbackOrchestrator:
    """
    Adjusts broadcast parameters based on feedback signals.

    Supports multiple feedback types:
    - entropy_delta: Implicit feedback from system entropy changes
    - human_rating: Explicit feedback from HUD thumbs up/down
    - template_effect: Feedback on template effectiveness

    The orchestrator maintains weights for each segment type and adjusts
    them based on accumulated feedback. Positive feedback increases weights,
    negative feedback decreases them.
    """

    def __init__(
        self,
        segment_pool: Any = None,
        personality_engine: Any = None
    ):
        """
        Initialize FeedbackOrchestrator.

        Args:
            segment_pool: SegmentPool instance for accessing segment types.
            personality_engine: PersonalityEngine instance for vocabulary tracking.
        """
        self._segment_pool = segment_pool
        self._personality_engine = personality_engine

        # Track weights for each segment type (starts at 1.0 = no adjustment)
        self._segment_weights: Dict[SegmentType, float] = {
            segment_type: DEFAULT_WEIGHT
            for segment_type in SegmentType
        }

        # Track vocabulary adjustments per station
        self._vocabulary_adjustments: Dict[str, Dict[str, str]] = defaultdict(dict)

        # Track pending feedback signals
        self._feedback_history: List[FeedbackSignal] = []

        # Track feedback counts per segment type for debugging
        self._feedback_counts: Dict[str, int] = defaultdict(int)

    def accept_feedback(self, signal: FeedbackSignal) -> None:
        """
        Accept and process a feedback signal.

        Args:
            signal: The feedback signal to process.
        """
        # Validate signal
        if signal.signal_type not in ("entropy_delta", "human_rating", "template_effect"):
            return  # Ignore unknown signal types

        if not -1.0 <= signal.value <= 1.0:
            return  # Ignore out-of-range values

        # Store in history (capped at 100)
        self._feedback_history.append(signal)
        if len(self._feedback_history) > 100:
            self._feedback_history.pop(0)

        # Track feedback count
        self._feedback_counts[signal.signal_type] += 1

        # Adjust segment weights if segment_type is specified
        if signal.segment_type:
            try:
                segment_type = SegmentType(signal.segment_type)
                self._adjust_segment_weight(segment_type, signal.value)
            except ValueError:
                pass  # Invalid segment type, ignore

    def _adjust_segment_weight(self, segment_type: SegmentType, value: float) -> None:
        """
        Adjust the weight for a segment type based on feedback value.

        Args:
            segment_type: The segment type to adjust.
            value: The feedback value (-1.0 to 1.0).
        """
        current = self._segment_weights[segment_type]

        # Apply adjustment with diminishing returns
        adjustment = value * FEEDBACK_IMPACT

        # Reduce impact as weight approaches bounds
        if adjustment > 0 and current > 2.0:
            adjustment *= 0.5  # Slower increase when already high
        elif adjustment < 0 and current < 0.5:
            adjustment *= 0.5  # Slower decrease when already low

        new_weight = current + adjustment

        # Clamp to bounds
        self._segment_weights[segment_type] = max(MIN_WEIGHT, min(MAX_WEIGHT, new_weight))

    def get_adjusted_weights(self) -> Dict[SegmentType, float]:
        """
        Get the current adjusted weights for each segment type.

        Returns:
            Dictionary mapping SegmentType to adjusted weight.
        """
        return dict(self._segment_weights)

    def get_vocabulary_adjustments(self, station_id: str) -> Dict[str, str]:
        """
        Get vocabulary adjustments for a station.

        Args:
            station_id: The station ID to get adjustments for.

        Returns:
            Dictionary of original -> replacement vocabulary mappings.
        """
        # Return any accumulated vocabulary adjustments
        # For skeleton, this returns empty dict
        return dict(self._vocabulary_adjustments.get(station_id, {}))

    def record_broadcast_result(
        self,
        segment: Any,
        entropy_before: float,
        entropy_after: float
    ) -> None:
        """
        Record a broadcast result and generate implicit feedback.

        This method calculates the entropy delta and generates a feedback
        signal based on whether the broadcast increased or decreased system
        entropy.

        Args:
            segment: The BroadcastSegment that was broadcast.
            entropy_before: System entropy before the broadcast.
            entropy_after: System entropy after the broadcast.
        """
        # Calculate entropy delta
        entropy_delta = entropy_after - entropy_before

        # Only generate feedback if there's a meaningful change
        if abs(entropy_delta) < 0.01:
            return

        # Normalize to -1.0 to 1.0 range (assuming max delta of 0.5)
        normalized_delta = max(-1.0, min(1.0, entropy_delta * 2.0))

        # Create feedback signal
        signal = FeedbackSignal(
            signal_type="entropy_delta",
            value=normalized_delta,
            segment_type=segment.segment_type
        )

        self.accept_feedback(signal)

    def get_stats(self) -> Dict[str, Any]:
        """
        Get statistics about feedback processing.

        Returns:
            Dictionary with feedback statistics.
        """
        return {
            "total_feedback": len(self._feedback_history),
            "feedback_counts": dict(self._feedback_counts),
            "current_weights": {
                st.value: w for st, w in self._segment_weights.items()
            }
        }

    def reset_weights(self) -> None:
        """Reset all segment weights to default."""
        self._segment_weights = {
            segment_type: DEFAULT_WEIGHT
            for segment_type in SegmentType
        }
