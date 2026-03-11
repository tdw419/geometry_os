"""
Ouroboros Fracture Detector - Phase 56 (Self-Healing Kernel)

A Passive Tailer that monitors the ASCII Scene Graph at 1Hz and triggers
reflex responses when geometric coherence breaks down.
"""

import asyncio
import logging
import math
import time
from dataclasses import dataclass
from enum import Enum
from pathlib import Path
from typing import TYPE_CHECKING, Any, Optional

logger = logging.getLogger(__name__)

if TYPE_CHECKING:
    from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
    from systems.evolution_daemon.safety.data_structures import ASCIIFrame


class OuroborosReflex(Enum):
    """Reflex response levels for fracture detection."""
    NONE = 0              # Normal operation
    WARNING = 1           # Log anomaly, continue
    QUARANTINE = 2        # Freeze district, investigate
    EMERGENCY_FREEZE = 3  # Halt all mutations immediately

    def __lt__(self, other):
        """Support ordering based on value."""
        if isinstance(other, OuroborosReflex):
            return self.value < other.value
        return NotImplemented

    def __le__(self, other):
        """Support less than or equal."""
        if isinstance(other, OuroborosReflex):
            return self.value <= other.value
        return NotImplemented

    def __gt__(self, other):
        """Support greater than."""
        if isinstance(other, OuroborosReflex):
            return self.value > other.value
        return NotImplemented

    def __ge__(self, other):
        """Support greater than or equal."""
        if isinstance(other, OuroborosReflex):
            return self.value >= other.value
        return NotImplemented


@dataclass
class FractureConfig:
    """Configuration for the Ouroboros Fracture Detector."""
    # Sliding window size (frames)
    WINDOW_SIZE: int = 5

    # Pain threshold (0.0-1.0 drift)
    PAIN_THRESHOLD: float = 0.3

    # Individual signal thresholds
    MAX_POSITION_DELTA: int = 500      # pixels
    MAX_COUNT_DELTA: int = 10          # windows
    MAX_HEARTBEAT_AGE: float = 3.0     # seconds
    MAX_STABILITY_DROP: float = 0.5    # PAS stability component

    # District quarantine duration
    QUARANTINE_DURATION_SECONDS: int = 300  # 5 minutes default

    # ASCII Scene paths
    ASCII_SCENE_DIR: str = ".geometry/ascii_scene"


def calculate_position_drift(
    prev_windows: list[dict[str, Any]],
    curr_windows: list[dict[str, Any]],
    max_delta: int = 500
) -> float:
    """
    Calculate position drift between window sets.

    Returns a normalized drift score 0.0-1.0 where:
    - 0.0 = No position change
    - 1.0 = Maximum detected drift

    Args:
        prev_windows: Previous frame windows
        curr_windows: Current frame windows
        max_delta: Maximum expected position delta (for normalization)
    """
    if not prev_windows or not curr_windows:
        return 0.0

    # Build lookup by window ID (handle both string and numeric IDs)
    prev_by_id = {}
    curr_by_id = {}

    for w in prev_windows:
        if "id" in w and w["id"] is not None:
            prev_by_id[w["id"]] = w

    for w in curr_windows:
        if "id" in w and w["id"] is not None:
            curr_by_id[w["id"]] = w

    # If we have no windows with IDs, compare positions directly
    if not prev_by_id or not curr_by_id:
        return _calculate_position_fallback(prev_windows, curr_windows, max_delta)

    drift_scores = []

    # Calculate drift for matching windows
    for wid in prev_by_id:
        if wid in curr_by_id:
            prev_w = prev_by_id[wid]
            curr_w = curr_by_id[wid]

            # Euclidean distance with validation
            prev_x = prev_w.get("x", 0)
            prev_y = prev_w.get("y", 0)
            curr_x = curr_w.get("x", 0)
            curr_y = curr_w.get("y", 0)

            # Ensure position values are numeric
            try:
                prev_x = float(prev_x)
                prev_y = float(prev_y)
                curr_x = float(curr_x)
                curr_y = float(curr_y)
            except (ValueError, TypeError):
                # Skip window with invalid positions
                continue

            dx = abs(curr_x - prev_x)
            dy = abs(curr_y - prev_y)
            distance = math.sqrt(dx * dx + dy * dy)

            # Normalize to 0-1
            normalized = min(distance / max_delta, 1.0)
            drift_scores.append(normalized)

    # Penalize missing windows
    missing_count = len(prev_by_id) - len(set(prev_by_id.keys()) & set(curr_by_id.keys()))
    if len(prev_by_id) > 0:
        missing_penalty = missing_count / len(prev_by_id)
        drift_scores.append(missing_penalty)

    return max(drift_scores) if drift_scores else 0.0


def _calculate_position_fallback(
    prev_windows: list[dict[str, Any]],
    curr_windows: list[dict[str, Any]],
    max_delta: int
) -> float:
    """
    Fallback method when windows don't have IDs.

    Compares all possible window pairs to find matches based on position.
    """
    if not prev_windows or not curr_windows:
        return 0.0

    drift_scores = []
    matched_indices = set()

    # Try to match windows by proximity
    for i, prev_w in enumerate(prev_windows):
        best_match = None
        best_distance = float('inf')

        for j, curr_w in enumerate(curr_windows):
            if j in matched_indices:
                continue

            # Get position values with validation
            try:
                prev_x = float(prev_w.get("x", 0))
                prev_y = float(prev_w.get("y", 0))
                curr_x = float(curr_w.get("x", 0))
                curr_y = float(curr_w.get("y", 0))
            except (ValueError, TypeError):
                continue

            dx = abs(curr_x - prev_x)
            dy = abs(curr_y - prev_y)
            distance = math.sqrt(dx * dx + dy * dy)

            if distance < best_distance and distance < max_delta * 0.1:
                best_distance = distance
                best_match = j

        if best_match is not None:
            normalized = min(best_distance / max_delta, 1.0)
            drift_scores.append(normalized)
            matched_indices.add(best_match)

    # Penalize windows that couldn't be matched
    prev_unmatched = len(prev_windows) - len(matched_indices)
    curr_unmatched = len(curr_windows) - len(matched_indices)

    if len(prev_windows) > 0:
        unmatched_penalty = (prev_unmatched + curr_unmatched) / (2 * len(prev_windows))
        drift_scores.append(unmatched_penalty)

    return max(drift_scores) if drift_scores else 0.0


def calculate_geometric_drift(
    frames: list["ASCIIFrame"],
    config: FractureConfig | None = None
) -> float:
    """
    Calculate geometric drift between frames.

    Returns a value 0.0-1.0 where:
    - 0.0 = Perfect coherence (no drift)
    - 1.0 = Complete fracture (total incoherence)

    Args:
        frames: List of ASCIIFrame snapshots
        config: Optional configuration for thresholds
    """
    if len(frames) < 2:
        return 0.0

    config = config or FractureConfig()
    drift_scores = []

    for i in range(1, len(frames)):
        prev, curr = frames[i - 1], frames[i]

        # Position drift
        pos_drift = calculate_position_drift(
            prev.windows, curr.windows, config.MAX_POSITION_DELTA
        )

        # Count drift (normalized by expected max)
        count_delta = abs(curr.window_count - prev.window_count)
        count_drift = min(count_delta / config.MAX_COUNT_DELTA, 1.0)

        # Stability drift with None handling
        prev_stability = prev.stability if prev.stability is not None else 0.0
        curr_stability = curr.stability if curr.stability is not None else 0.0
        stability_drift = abs(prev_stability - curr_stability)
        # Normalize by max expected drop
        stability_drift_normalized = min(stability_drift / config.MAX_STABILITY_DROP, 1.0)

        # Combine drifts (weighted average)
        combined = (pos_drift + count_drift + stability_drift_normalized) / 3
        drift_scores.append(combined)

    return max(drift_scores)  # Return worst drift in window


def determine_reflex_level(
    drift: float,
    config: FractureConfig | None = None
) -> OuroborosReflex:
    """
    Determine the appropriate reflex level for a given drift score.

    Args:
        drift: Calculated drift score (0.0-1.0)
        config: Optional configuration for thresholds

    Returns:
        OuroborosReflex level
    """
    config = config or FractureConfig()
    threshold = config.PAIN_THRESHOLD

    if drift < threshold:
        return OuroborosReflex.NONE
    elif drift < threshold * 1.5:
        return OuroborosReflex.WARNING
    elif drift < threshold * 2.5:
        return OuroborosReflex.QUARANTINE
    else:
        return OuroborosReflex.EMERGENCY_FREEZE


class FractureDetector:
    """
    Ouroboros Fracture Detector - The Spinal Cord of Geometry OS.

    Monitors the ASCII Scene Graph at 1Hz and triggers reflex responses
    when geometric coherence breaks down.
    """

    def __init__(
        self,
        daemon: Optional["EvolutionDaemon"] = None,
        config: FractureConfig | None = None
    ):
        self.daemon = daemon
        self.config = config or FractureConfig()

        # Frame buffer for sliding window analysis
        self._frame_buffer: list[ASCIIFrame] = []

        # Quarantine state (district -> quarantine_start_time)
        self._quarantined_districts: dict[str, float] = {}

        # Metrics
        self._drift_current: float = 0.0
        self._last_fracture: FractureEvent | None = None

        # State
        self._emergency_freeze: bool = False
        self._running: bool = False
        self._project_root = Path.cwd()

    def is_district_quarantined(self, district: str) -> bool:
        """Check if a district is currently quarantined."""
        if district not in self._quarantined_districts:
            return False

        # Check if quarantine has expired
        start_time = self._quarantined_districts[district]
        age = time.time() - start_time

        if age > self.config.QUARANTINE_DURATION_SECONDS:
            # Auto-expire
            del self._quarantined_districts[district]
            return False

        return True

    def quarantine_district(self, district: str) -> None:
        """Put a district into quarantine."""
        self._quarantined_districts[district] = time.time()
        logger.warning(f"🛡️ District '{district}' quarantined by Ouroboros")

    def release_district(self, district: str) -> None:
        """Release a district from quarantine."""
        if district in self._quarantined_districts:
            del self._quarantined_districts[district]
            logger.info(f"✅ District '{district}' released from quarantine")

    def get_current_drift(self) -> float:
        """Get the current drift score."""
        return self._drift_current

    def _parse_gnb_state(self) -> Optional["ASCIIFrame"]:
        """
        Parse the GNB state ASCII file into an ASCIIFrame.

        Reads .geometry/gnb_state.ascii and extracts timestamp and heartbeat age.
        Returns None if the file doesn't exist or parsing fails.

        Returns:
            Optional[ASCIIFrame]: Parsed frame data or None
        """
        from systems.evolution_daemon.safety.data_structures import ASCIIFrame

        gnb_path = self._project_root / ".geometry" / "gnb_state.ascii"

        if not gnb_path.exists():
            return None

        try:
            content = gnb_path.read_text()
            lines = content.strip().split("\n")

            timestamp = time.time()
            heartbeat_age = 0.0

            # Extract timestamp from file content
            for line in lines:
                if line.startswith("TIMESTAMP:"):
                    timestamp = float(line.split(":", 1)[1].strip())

            # Calculate heartbeat age from file modification time
            if gnb_path.exists():
                mtime = gnb_path.stat().st_mtime
                heartbeat_age = time.time() - mtime

            return ASCIIFrame(
                timestamp=timestamp,
                heartbeat_age=heartbeat_age
            )

        except Exception as e:
            logger.warning(f"Failed to parse GNB state: {e}")
            return None

    def _parse_shell_fragments(self) -> list[dict[str, Any]]:
        """
        Parse the shell_fragments.ascii file for window data.

        Reads .geometry/ascii_scene/shell_fragments.ascii and extracts window
        position and size information. Returns empty list if file doesn't exist
        or parsing fails.

        Returns:
            List[Dict[str, Any]]: List of window dictionaries with id, x, y,
                                   width, height keys
        """
        frag_path = (
            self._project_root /
            self.config.ASCII_SCENE_DIR /
            "shell_fragments.ascii"
        )

        if not frag_path.exists():
            return []

        try:
            content = frag_path.read_text()
            windows = []

            # Simple YAML-like parsing for window entries
            current_window = {}
            for line in content.split("\n"):
                line = line.strip()

                if line.startswith("- id:"):
                    if current_window:
                        windows.append(current_window)
                    current_window = {"id": line.split(":", 1)[1].strip()}
                elif line.startswith("x:"):
                    current_window["x"] = int(line.split(":", 1)[1].strip())
                elif line.startswith("y:"):
                    current_window["y"] = int(line.split(":", 1)[1].strip())
                elif line.startswith("width:"):
                    current_window["width"] = int(line.split(":", 1)[1].strip())
                elif line.startswith("height:"):
                    current_window["height"] = int(line.split(":", 1)[1].strip())

            # Don't forget the last window
            if current_window:
                windows.append(current_window)

            return windows

        except Exception as e:
            logger.warning(f"Failed to parse shell fragments: {e}")
            return []

    def _capture_frame(self) -> "ASCIIFrame":
        """Capture current state as an ASCIIFrame."""
        from systems.evolution_daemon.safety.data_structures import ASCIIFrame

        # Parse GNB state
        gnb_frame = self._parse_gnb_state()

        # Parse window data
        windows = self._parse_shell_fragments()

        # Build frame
        frame = ASCIIFrame(
            timestamp=gnb_frame.timestamp if gnb_frame else time.time(),
            window_count=len(windows),
            windows=windows,
            heartbeat_age=gnb_frame.heartbeat_age if gnb_frame else 0.0
        )

        # Add to buffer (sliding window)
        self._frame_buffer.append(frame)

        # Trim buffer to window size
        while len(self._frame_buffer) > self.config.WINDOW_SIZE:
            self._frame_buffer.pop(0)

        return frame

    def _analyze_frames(self) -> float:
        """Analyze frame buffer for geometric drift."""
        if len(self._frame_buffer) < 2:
            return 0.0

        return calculate_geometric_drift(self._frame_buffer, self.config)

    def _trigger_reflex(
        self,
        reflex: OuroborosReflex,
        drift: float,
        signal_type: str = "unknown",
        affected_districts: list[str] | None = None
    ) -> "FractureEvent":
        """Trigger a reflex response to a detected fracture."""
        from systems.evolution_daemon.safety.data_structures import FractureEvent

        affected_districts = affected_districts or []

        event = FractureEvent(
            timestamp=time.time(),
            reflex_level=reflex,
            drift_score=drift,
            signal_type=signal_type,
            affected_districts=affected_districts
        )

        # Update metrics
        self._last_fracture = event

        # Execute reflex action
        if reflex == OuroborosReflex.WARNING:
            logger.warning(f"⚠️ Ouroboros WARNING: {signal_type} (drift={drift:.2f})")

        elif reflex == OuroborosReflex.QUARANTINE:
            logger.error(f"🛡️ Ouroboros QUARANTINE: {signal_type} (drift={drift:.2f})")
            for district in affected_districts:
                self.quarantine_district(district)

        elif reflex == OuroborosReflex.EMERGENCY_FREEZE:
            logger.critical(f"🚨 Ouroboros EMERGENCY_FREEZE: {signal_type} (drift={drift:.2f})")
            self._emergency_freeze = True
            if self.daemon is not None and hasattr(self.daemon, 'pause_mutations'):
                self.daemon.pause_mutations("Ouroboros emergency freeze")

        # Write alert log
        self._write_alert_log(event)

        return event

    def _write_alert_log(self, event: "FractureEvent") -> None:
        """Write fracture event to alert log."""
        from datetime import datetime

        alert_path = self._project_root / ".loop" / "ouroboros_alerts.log"
        alert_path.parent.mkdir(parents=True, exist_ok=True)

        with open(alert_path, "a") as f:
            f.write(
                f"[{datetime.now().isoformat()}] "
                f"REFLEX={event.reflex_level.name} "
                f"DRIFT={event.drift_score:.3f} "
                f"SIGNAL={event.signal_type} "
                f"DISTRICTS={','.join(event.affected_districts)}\n"
            )

    def is_emergency_frozen(self) -> bool:
        """Check if system is in emergency freeze state."""
        return self._emergency_freeze

    def clear_emergency_freeze(self) -> None:
        """Clear emergency freeze state (manual intervention)."""
        self._emergency_freeze = False
        logger.info("✅ Ouroboros emergency freeze cleared")

    def predict_fracture(self, dream_frame: "ASCIIFrame") -> float:
        """
        Predict if a dream frame would cause a fracture.

        Compares the dream frame against the current baseline (last captured real frame).
        Returns a 'Preemptive Reflex' score (0.0-1.0).
        """
        if not self._frame_buffer:
            # If no real frames captured yet, try to capture one now
            self._capture_frame()

        if not self._frame_buffer:
            return 0.0  # No baseline to compare against

        baseline = self._frame_buffer[-1]

        # Calculate drift between baseline and dream
        drift = calculate_geometric_drift([baseline, dream_frame], self.config)

        logger.info(f"🔮 Ouroboros Predictive Analysis: drift={drift:.3f}")
        return drift

    async def run(self) -> None:
        """Main monitoring loop at 1Hz."""
        logger.info(f"🧬 Ouroboros Fracture Detector starting (PAIN_THRESHOLD={self.config.PAIN_THRESHOLD})")
        self._running = True

        try:
            while self._running:
                # 1. Capture current frame
                self._capture_frame()

                # 2. Analyze drift if we have enough frames
                if len(self._frame_buffer) >= 2:
                    drift = self._analyze_frames()
                    self._drift_current = drift

                    # 3. Check for fracture signals
                    reflex = determine_reflex_level(drift, self.config)

                    if reflex != OuroborosReflex.NONE:
                        signal = self._detect_signal_type(drift)
                        districts = self._identify_affected_districts()
                        self._trigger_reflex(reflex, drift, signal, districts)

                    # 4. Check heartbeat desync separately
                    if self._frame_buffer:
                        last_frame = self._frame_buffer[-1]
                        if last_frame.heartbeat_age > self.config.MAX_HEARTBEAT_AGE:
                            self._trigger_reflex(
                                OuroborosReflex.EMERGENCY_FREEZE,
                                drift=1.0,
                                signal_type="heartbeat_desync"
                            )

                    # 5. Write metrics
                    self._write_metrics()

                # Sleep for 1 second (1Hz monitoring)
                await asyncio.sleep(1.0)

        except asyncio.CancelledError:
            logger.info("Ouroboros detector cancelled")
        except Exception as e:
            logger.error(f"Ouroboros detector crashed: {e}")
        finally:
            self._running = False
            logger.info("🛑 Ouroboros Fracture Detector stopped")

    def stop(self) -> None:
        """Stop the detector loop."""
        self._running = False

    def _detect_signal_type(self, drift: float) -> str:
        """Determine which fracture signal type triggered the reflex."""
        if len(self._frame_buffer) < 2:
            return "unknown"

        prev = self._frame_buffer[-2]
        curr = self._frame_buffer[-1]

        # Check for window explosion
        count_delta = abs(curr.window_count - prev.window_count)
        if count_delta > self.config.MAX_COUNT_DELTA:
            return "window_explosion"

        # Check for window teleport
        pos_drift = calculate_position_drift(
            prev.windows, curr.windows, self.config.MAX_POSITION_DELTA
        )
        if pos_drift > 0.5:
            return "window_teleport"

        # Check for PAS collapse
        stability_drop = prev.stability - curr.stability
        if stability_drop > self.config.MAX_STABILITY_DROP:
            return "pas_collapse"

        return "geometric_drift"

    def _identify_affected_districts(self) -> list[str]:
        """Identify which districts are affected by current drift."""
        # For now, return empty - can be enhanced with district mapping
        return []

    def _write_metrics(self) -> None:
        """Write current metrics to ASCII file."""
        metrics_path = (
            self._project_root /
            self.config.ASCII_SCENE_DIR /
            "ouroboros_metrics.ascii"
        )
        metrics_path.parent.mkdir(parents=True, exist_ok=True)

        content = f"""# Ouroboros Fracture Metrics
drift_current: {self._drift_current:.3f}
drift_max_24h: {self._drift_current:.3f}
reflexes_triggered_24h: 0
  - WARNING: 0
  - QUARANTINE: 0
  - EMERGENCY_FREEZE: 0
districts_quarantined: {len(self._quarantined_districts)}
emergency_frozen: {self._emergency_freeze}
last_fracture: {self._last_fracture.signal_type if self._last_fracture else 'null'}
"""
        metrics_path.write_text(content)
