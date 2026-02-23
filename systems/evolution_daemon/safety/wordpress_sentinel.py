"""
WordPress Sentinel - Telemetry Scanner

Scans WordPress telemetry files for behavioral events and converts them
to BehavioralEvent objects for the BehavioralMonitor.

Supports:
- JSON files (single objects)
- JSONL files (newline-delimited JSON)

Features:
- Incremental scanning via file position tracking
- Graceful handling of missing files
- Automatic event type detection from telemetry data
"""

import json
import logging
import os
import uuid
from pathlib import Path
from typing import Dict, List, Optional, Any

from systems.evolution_daemon.safety.data_structures import BehavioralEvent

logger = logging.getLogger(__name__)


class WordPressSentinel:
    """
    Scans WordPress telemetry directory for behavioral events.

    Converts telemetry data from WordPress plugin into BehavioralEvent
    objects suitable for anomaly detection by BehavioralMonitor.

    Attributes:
        telemetry_path: Path to WordPress telemetry directory
        _file_positions: Dict tracking read positions for incremental scanning
    """

    DEFAULT_TELEMETRY_PATH = "wordpress_zone/telemetry"

    def __init__(self, telemetry_path: Optional[str] = None):
        """
        Initialize WordPressSentinel.

        Args:
            telemetry_path: Path to telemetry directory (default: wordpress_zone/telemetry)
        """
        self.telemetry_path = Path(telemetry_path or self.DEFAULT_TELEMETRY_PATH)
        self._file_positions: Dict[str, int] = {}

    def get_file_position(self, filepath: str) -> int:
        """
        Get the last read position for a file.

        Args:
            filepath: Path to the file

        Returns:
            Byte position to resume reading from (0 if not tracked)
        """
        return self._file_positions.get(filepath, 0)

    def set_file_position(self, filepath: str, pos: int) -> None:
        """
        Set the read position for a file.

        Args:
            filepath: Path to the file
            pos: Byte position to record
        """
        self._file_positions[filepath] = pos

    def scan_telemetry(self, incremental: bool = True) -> List[BehavioralEvent]:
        """
        Scan telemetry directory for behavioral events.

        Walks the telemetry directory and reads all .json and .jsonl files,
        converting their contents to BehavioralEvent objects.

        Args:
            incremental: If True, only read new content since last scan

        Returns:
            List of BehavioralEvent objects extracted from telemetry files
        """
        events: List[BehavioralEvent] = []

        if not self.telemetry_path.exists():
            logger.warning(f"Telemetry path does not exist: {self.telemetry_path}")
            return events

        if not self.telemetry_path.is_dir():
            logger.warning(f"Telemetry path is not a directory: {self.telemetry_path}")
            return events

        for root, dirs, files in os.walk(self.telemetry_path):
            for filename in files:
                filepath = Path(root) / filename

                if filename.endswith('.jsonl'):
                    file_events = self._scan_jsonl_file(filepath, incremental)
                    events.extend(file_events)
                elif filename.endswith('.json'):
                    # Skip non-telemetry JSON files (e.g., config files)
                    file_events = self._scan_json_file(filepath, incremental)
                    events.extend(file_events)

        return events

    def _scan_jsonl_file(self, filepath: Path, incremental: bool) -> List[BehavioralEvent]:
        """
        Scan a JSONL file for events.

        Args:
            filepath: Path to JSONL file
            incremental: Whether to use incremental reading

        Returns:
            List of BehavioralEvent objects
        """
        events: List[BehavioralEvent] = []
        filepath_str = str(filepath)

        try:
            file_size = filepath.stat().st_size
            start_pos = self.get_file_position(filepath_str) if incremental else 0

            # If file shrank or was rotated, reset position
            if start_pos > file_size:
                start_pos = 0

            if start_pos == file_size:
                # No new content
                return events

            with open(filepath, 'r', encoding='utf-8') as f:
                f.seek(start_pos)

                for line in f:
                    line = line.strip()
                    if not line:
                        continue

                    try:
                        data = json.loads(line)
                        event = self._convert_to_behavioral_event(data, filepath_str)
                        if event:
                            events.append(event)
                    except json.JSONDecodeError as e:
                        logger.warning(f"Failed to parse JSON in {filepath}: {e}")
                        continue

                # Record new position
                self.set_file_position(filepath_str, f.tell())

        except FileNotFoundError:
            logger.warning(f"Telemetry file not found: {filepath}")
        except PermissionError:
            logger.warning(f"Permission denied reading telemetry: {filepath}")
        except Exception as e:
            logger.warning(f"Error reading telemetry file {filepath}: {e}")

        return events

    def _scan_json_file(self, filepath: Path, incremental: bool) -> List[BehavioralEvent]:
        """
        Scan a JSON file for events.

        For incremental scanning, uses file modification time to detect changes.
        JSON files are typically small configuration or single-event files.

        Args:
            filepath: Path to JSON file
            incremental: Whether to use incremental reading

        Returns:
            List of BehavioralEvent objects
        """
        events: List[BehavioralEvent] = []
        filepath_str = str(filepath)

        try:
            # For JSON files, check if we've already processed it
            # Use a sentinel value (-1) to indicate "already processed"
            if incremental and self.get_file_position(filepath_str) == -1:
                return events

            with open(filepath, 'r', encoding='utf-8') as f:
                content = f.read()

            try:
                data = json.loads(content)
                event = self._convert_to_behavioral_event(data, filepath_str)
                if event:
                    events.append(event)

                # Mark as processed for incremental mode
                if incremental:
                    self.set_file_position(filepath_str, -1)

            except json.JSONDecodeError as e:
                logger.warning(f"Failed to parse JSON in {filepath}: {e}")

        except FileNotFoundError:
            logger.warning(f"Telemetry file not found: {filepath}")
        except PermissionError:
            logger.warning(f"Permission denied reading telemetry: {filepath}")
        except Exception as e:
            logger.warning(f"Error reading telemetry file {filepath}: {e}")

        return events

    def _convert_to_behavioral_event(
        self,
        data: Dict[str, Any],
        source_file: str
    ) -> Optional[BehavioralEvent]:
        """
        Convert telemetry data dict to BehavioralEvent.

        Maps WordPress telemetry fields to BehavioralEvent attributes:
        - type -> event_type
        - source -> agent_id
        - timestamp -> timestamp (converted from Unix if numeric)
        - data -> metadata

        Args:
            data: Parsed JSON data from telemetry
            source_file: Path to source file (for logging)

        Returns:
            BehavioralEvent or None if conversion fails
        """
        try:
            # Extract event type
            event_type = data.get('type', 'unknown')
            if not event_type:
                event_type = 'unknown'

            # Extract agent ID from source field
            agent_id = data.get('source', 'wordpress_unknown')
            if not agent_id:
                agent_id = 'wordpress_unknown'

            # Handle timestamp (could be Unix timestamp or ISO string)
            timestamp_raw = data.get('timestamp')
            if timestamp_raw is None:
                from datetime import datetime
                timestamp = datetime.now().isoformat()
            elif isinstance(timestamp_raw, (int, float)):
                # Unix timestamp - convert to ISO
                from datetime import datetime
                timestamp = datetime.fromtimestamp(timestamp_raw).isoformat()
            else:
                timestamp = str(timestamp_raw)

            # Generate event ID
            event_id = str(uuid.uuid4())

            # Extract metadata (everything except core fields)
            metadata = {k: v for k, v in data.items()
                       if k not in ('type', 'source', 'timestamp')}

            # Include the actual data payload if present
            if 'data' in data and isinstance(data['data'], dict):
                metadata.update(data['data'])

            event = BehavioralEvent(
                event_id=event_id,
                agent_id=agent_id,
                event_type=event_type,
                timestamp=timestamp,
                metadata=metadata
            )

            # Calculate entropy
            event.calculate_entropy()

            return event

        except Exception as e:
            logger.warning(f"Failed to convert telemetry to event: {e}")
            return None

    def reset_positions(self) -> None:
        """
        Reset all file position tracking.

        Useful for forcing a full rescan of all telemetry files.
        """
        self._file_positions.clear()

    def get_tracked_files(self) -> Dict[str, int]:
        """
        Get all tracked file positions.

        Returns:
            Dict mapping filepath to byte position
        """
        return dict(self._file_positions)
