#!/usr/bin/env python3
"""
Infinite Map Access Frequency Predictor.

ML-lite access pattern prediction for Hot Zone optimization.

Uses exponential moving average of access intervals to predict
when files will be accessed next, enabling proactive caching.
"""

import json
import time
from collections import defaultdict
from typing import Dict, List, Optional, Tuple, Any
from dataclasses import dataclass, asdict


@dataclass
class PredictionStats:
    """Statistics about access predictions."""
    total_accesses: int
    unique_files: int
    avg_interval: float
    hot_files: int


class AccessPredictor:
    """
    ML-lite access pattern predictor for Hot Zone optimization.

    Predicts when files will be accessed next based on historical
    access patterns using exponential moving average.

    Features:
    - record_access() - Track file access timestamps
    - predict_next_access() - Predict when file will be accessed next
    - get_hot_files() - Return files predicted to be accessed soon
    - export/import history for persistence
    """

    VERSION = "1.0"

    def __init__(self, history_size: int = 1000):
        """
        Initialize access predictor.

        Args:
            history_size: Maximum number of accesses to track per file
        """
        self.access_history: Dict[str, List[float]] = defaultdict(list)
        self.history_size = history_size

    def record_access(self, path: str, timestamp: Optional[float] = None):
        """
        Record file access for prediction learning.

        Args:
            path: File path being accessed
            timestamp: Access timestamp (default: current time)
        """
        if timestamp is None:
            timestamp = time.time()

        self.access_history[path].append(timestamp)

        # Prune to history size
        if len(self.access_history[path]) > self.history_size:
            self.access_history[path] = self.access_history[path][-self.history_size:]

    def predict_next_access(self, path: str) -> Optional[float]:
        """
        Predict when file will be accessed next.

        Uses exponential moving average of access intervals.
        Requires at least 2 historical accesses.

        Args:
            path: File path to predict

        Returns:
            Predicted next access timestamp, or None if insufficient data
        """
        if path not in self.access_history or len(self.access_history[path]) < 2:
            return None

        # Get access history sorted by time
        accesses = sorted(self.access_history[path])

        # Calculate intervals between consecutive accesses
        intervals = [accesses[i + 1] - accesses[i] for i in range(len(accesses) - 1)]

        if not intervals:
            return None

        # Exponential moving average with heavier weight on recent intervals
        # weights: 2^n where n is position from most recent
        weights = [2 ** i for i in range(len(intervals) - 1, -1, -1)]

        weighted_sum = sum(i * w for i, w in zip(intervals, weights))
        total_weight = sum(weights)

        predicted_interval = weighted_sum / total_weight

        # Predict next access from last access time
        last_access = accesses[-1]
        return last_access + predicted_interval

    def get_hot_files(self, threshold_seconds: int = 300) -> List[Tuple[str, float]]:
        """
        Get files predicted to be accessed within threshold.

        Args:
            threshold_seconds: Time window for "hot" files (default: 5 min)

        Returns:
            List of (path, predicted_time) tuples, sorted by predicted time
        """
        hot_files = []
        now = time.time()

        for path, history in self.access_history.items():
            if not history:
                continue

            last_access = history[-1]
            prediction = self.predict_next_access(path)

            # Include if predicted within threshold OR recently accessed
            if prediction and (prediction - now) <= threshold_seconds:
                hot_files.append((path, prediction))
            elif (now - last_access) <= threshold_seconds:
                hot_files.append((path, now))

        # Sort by predicted/accessed time
        hot_files.sort(key=lambda x: x[1])
        return hot_files[:100]  # Top 100 hot files

    def get_statistics(self) -> Dict[str, Any]:
        """
        Get statistics about access patterns.

        Returns:
            Dictionary with statistics
        """
        total_accesses = sum(len(history) for history in self.access_history.values())
        unique_files = len(self.access_history)

        # Calculate average interval across all files
        all_intervals = []
        for history in self.access_history.values():
            if len(history) >= 2:
                sorted_history = sorted(history)
                for i in range(len(sorted_history) - 1):
                    all_intervals.append(sorted_history[i + 1] - sorted_history[i])

        avg_interval = sum(all_intervals) / len(all_intervals) if all_intervals else 0

        hot_files = len(self.get_hot_files(threshold_seconds=300))

        return {
            'total_accesses': total_accesses,
            'unique_files': unique_files,
            'avg_interval': avg_interval,
            'hot_files': hot_files,
            'history_size': self.history_size,
        }

    def clear_history(self):
        """Clear all access history."""
        self.access_history.clear()

    def export_history(self) -> Dict[str, Any]:
        """
        Export access history for persistence.

        Returns:
            Dictionary with access history and metadata
        """
        # Convert defaultdict to regular dict for JSON serialization
        history_dict = {
            path: timestamps
            for path, timestamps in self.access_history.items()
        }

        return {
            'version': self.VERSION,
            'export_time': time.time(),
            'history_size': self.history_size,
            'access_history': history_dict,
        }

    def import_history(self, data: Dict[str, Any]):
        """
        Import access history from exported data.

        Args:
            data: Dictionary from export_history()
        """
        version = data.get('version', '')
        if version != self.VERSION:
            raise ValueError(f"Version mismatch: expected {self.VERSION}, got {version}")

        history_data = data.get('access_history', {})

        # Restore history
        for path, timestamps in history_data.items():
            self.access_history[path] = list(timestamps)

        # Update history size if specified
        if 'history_size' in data:
            self.history_size = data['history_size']


def main():
    """CLI for access predictor testing."""
    import argparse
    import sys

    parser = argparse.ArgumentParser(
        description='Infinite Map Access Frequency Predictor',
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )

    parser.add_argument('--record', metavar='PATH',
                      help='Record file access')
    parser.add_argument('--predict', metavar='PATH',
                      help='Predict next access for file')
    parser.add_argument('--hot', type=int, default=300, metavar='SECONDS',
                      help='List hot files within threshold (default: 300)')
    parser.add_argument('--stats', action='store_true',
                      help='Show access statistics')
    parser.add_argument('--export', metavar='FILE',
                      help='Export history to file')
    parser.add_argument('--import-file', metavar='FILE',
                      dest='import_path',
                      help='Import history from file')

    args = parser.parse_args()

    predictor = AccessPredictor()

    try:
        if args.record:
            predictor.record_access(args.record)
            print(f"[*] Recorded access: {args.record}")

        if args.predict:
            prediction = predictor.predict_next_access(args.predict)
            if prediction:
                from datetime import datetime
                pred_time = datetime.fromtimestamp(prediction)
                print(f"[*] Predicted next access: {pred_time.isoformat()}")
            else:
                print(f"[!] No prediction available for: {args.predict}")

        if args.stats:
            stats = predictor.get_statistics()
            print(f"[*] Access Statistics:")
            print(f"    Total accesses: {stats['total_accesses']}")
            print(f"    Unique files: {stats['unique_files']}")
            print(f"    Avg interval: {stats['avg_interval']:.2f}s")
            print(f"    Hot files: {stats['hot_files']}")

        if args.hot:
            hot = predictor.get_hot_files(threshold_seconds=args.hot)
            print(f"[*] Hot files (within {args.hot}s):")
            for path, when in hot[:10]:
                from datetime import datetime
                time_str = datetime.fromtimestamp(when).strftime("%H:%M:%S")
                print(f"    {path} @ {time_str}")

        if args.export:
            data = predictor.export_history()
            with open(args.export, 'w') as f:
                json.dump(data, f, indent=2)
            print(f"[*] Exported history to: {args.export}")

        if args.import_path:
            with open(args.import_path, 'r') as f:
                data = json.load(f)
            predictor.import_history(data)
            print(f"[*] Imported history from: {args.import_path}")

        if not any([args.record, args.predict, args.stats, args.hot, args.export, args.import_path]):
            parser.print_help()

    except Exception as e:
        print(f"[!] Error: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == '__main__':
    main()
