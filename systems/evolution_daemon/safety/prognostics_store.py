"""
Evolution Daemon V13 - Prognostics Store

SQLite-based storage for historical RTS integrity data.
Used by the PrognosticsEngine for predictive modeling.
"""

import sqlite3
import json
import logging
from datetime import datetime, timedelta
from typing import List, Dict, Any, Tuple, Optional

logger = logging.getLogger("evolution_daemon.prognostics_store")


class PrognosticsStore:
    """Stores and retrieves historical RTS integrity data."""

    def __init__(self, db_path: str):
        self.db_path = db_path
        self._init_database()

    def _init_database(self):
        """Initialize the SQLite database schema."""
        with sqlite3.connect(self.db_path) as conn:
            conn.execute("""
                CREATE TABLE IF NOT EXISTS integrity_history (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    timestamp TEXT NOT NULL,
                    rts_path TEXT NOT NULL,
                    file_size INTEGER,
                    modification_count INTEGER,
                    file_age_days REAL,
                    hilbert_locality REAL,
                    mean_entropy REAL
                )
            """)
            conn.execute("""
                CREATE INDEX IF NOT EXISTS idx_rts_path
                ON integrity_history(rts_path)
            """)
            conn.execute("""
                CREATE INDEX IF NOT EXISTS idx_timestamp
                ON integrity_history(timestamp)
            """)
            conn.commit()
        logger.info(f"PrognosticsStore initialized at {self.db_path}")

    def log_integrity_check(
        self,
        rts_path: str,
        file_size: int,
        modification_count: int,
        file_age_days: float,
        hilbert_locality: float,
        mean_entropy: float
    ):
        """Log an integrity check result to the database."""
        timestamp = datetime.now().isoformat()

        with sqlite3.connect(self.db_path) as conn:
            conn.execute("""
                INSERT INTO integrity_history
                (timestamp, rts_path, file_size, modification_count,
                 file_age_days, hilbert_locality, mean_entropy)
                VALUES (?, ?, ?, ?, ?, ?, ?)
            """, (timestamp, rts_path, file_size, modification_count,
                  file_age_days, hilbert_locality, mean_entropy))
            conn.commit()

        logger.debug(f"Logged integrity check for {rts_path}")

    def get_history(self, rts_path: str, limit: int = 100) -> List[Dict[str, Any]]:
        """Get integrity history for a specific RTS file."""
        with sqlite3.connect(self.db_path) as conn:
            conn.row_factory = sqlite3.Row
            cursor = conn.execute("""
                SELECT * FROM integrity_history
                WHERE rts_path = ?
                ORDER BY timestamp DESC
                LIMIT ?
            """, (rts_path, limit))

            return [dict(row) for row in cursor.fetchall()]

    def get_all_recent_data(self, hours: int = 24) -> List[Dict[str, Any]]:
        """Get all integrity data from the last N hours."""
        cutoff = (datetime.now() - timedelta(hours=hours)).isoformat()

        with sqlite3.connect(self.db_path) as conn:
            conn.row_factory = sqlite3.Row
            cursor = conn.execute("""
                SELECT * FROM integrity_history
                WHERE timestamp >= ?
                ORDER BY timestamp DESC
            """, (cutoff,))

            return [dict(row) for row in cursor.fetchall()]

    def get_training_data(self) -> Tuple[List[List[float]], List[float]]:
        """
        Get data formatted for model training.

        Returns:
            features: List of [file_size, mod_count, age, locality, entropy]
            targets: List of next locality values (what we want to predict)
        """
        with sqlite3.connect(self.db_path) as conn:
            conn.row_factory = sqlite3.Row
            cursor = conn.execute("""
                SELECT * FROM integrity_history
                ORDER BY rts_path, timestamp
            """)

            rows = [dict(row) for row in cursor.fetchall()]

        # Group by file and create sequential pairs
        features = []
        targets = []

        # Group by path
        by_path = {}
        for row in rows:
            path = row["rts_path"]
            if path not in by_path:
                by_path[path] = []
            by_path[path].append(row)

        # Create training pairs (current features -> next locality)
        for path, file_rows in by_path.items():
            for i in range(len(file_rows) - 1):
                current = file_rows[i]
                next_row = file_rows[i + 1]

                features.append([
                    current["file_size"] or 0,
                    current["modification_count"] or 0,
                    current["file_age_days"] or 0,
                    current["hilbert_locality"] or 0,
                    current["mean_entropy"] or 0
                ])
                targets.append(next_row["hilbert_locality"] or 0)

        return features, targets
