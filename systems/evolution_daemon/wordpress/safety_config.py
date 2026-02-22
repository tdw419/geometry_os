"""
Safety configuration and backup system for WordPress Evolution Daemon.

Provides safety mechanisms for content modifications including:
- Configuration for safety thresholds
- Content backup/restore functionality
- Proposal safety validation
"""

import json
import logging
import os
import time
from dataclasses import dataclass, field
from pathlib import Path
from typing import Optional, Tuple, Dict, Any, List

logger = logging.getLogger("safety_config")


@dataclass
class SafetyConfig:
    """Configuration for safety controls in content modifications."""
    require_backup: bool = True
    min_confidence: float = 0.7
    backup_dir: str = "/tmp/wp_evolution_backups"
    max_modifications_per_hour: int = 10

    def __post_init__(self):
        """Validate configuration values."""
        if self.min_confidence < 0.0 or self.min_confidence > 1.0:
            raise ValueError(f"min_confidence must be between 0.0 and 1.0, got {self.min_confidence}")
        if self.max_modifications_per_hour < 1:
            raise ValueError(f"max_modifications_per_hour must be at least 1, got {self.max_modifications_per_hour}")


class ContentBackup:
    """
    Manages content backups for safe modifications.

    Creates JSON backups with post_id, content, timestamp, and restored flag.
    Supports save, load, and restore operations.
    """

    def __init__(self, config: Optional[SafetyConfig] = None):
        """
        Initialize backup manager with optional safety config.

        Args:
            config: SafetyConfig instance, uses defaults if None
        """
        self.config = config or SafetyConfig()
        self.backup_dir = Path(self.config.backup_dir)

        # Create backup directory if it doesn't exist
        os.makedirs(self.backup_dir, exist_ok=True)
        logger.info(f"ContentBackup initialized with backup_dir={self.backup_dir}")

    def save(
        self,
        post_id: int,
        content: str,
        metadata: Optional[Dict[str, Any]] = None
    ) -> Path:
        """
        Save content backup to JSON file.

        Args:
            post_id: WordPress post ID
            content: Original content to backup
            metadata: Optional additional metadata

        Returns:
            Path to the backup file
        """
        timestamp = int(time.time())
        filename = f"post_{post_id}_{timestamp}.json"
        filepath = self.backup_dir / filename

        backup_data = {
            "post_id": post_id,
            "content": content,
            "timestamp": timestamp,
            "restored": False,
            "metadata": metadata or {}
        }

        with open(filepath, 'w', encoding='utf-8') as f:
            json.dump(backup_data, f, indent=2, ensure_ascii=False)

        logger.info(f"Saved backup for post {post_id} to {filepath}")
        return filepath

    def load(
        self,
        post_id: int,
        restored: Optional[bool] = None
    ) -> Optional[Dict[str, Any]]:
        """
        Load most recent backup for a post.

        Args:
            post_id: WordPress post ID
            restored: Filter by restored flag, None for all

        Returns:
            Backup data dict or None if no backup found
        """
        # Find all backup files for this post
        pattern = f"post_{post_id}_*.json"
        backups = list(self.backup_dir.glob(pattern))

        if not backups:
            logger.debug(f"No backups found for post {post_id}")
            return None

        # Load all matching backups and filter by restored flag
        valid_backups = []
        for backup_path in backups:
            try:
                with open(backup_path, 'r', encoding='utf-8') as f:
                    data = json.load(f)
                    if restored is None or data.get("restored") == restored:
                        valid_backups.append(data)
            except (json.JSONDecodeError, IOError) as e:
                logger.warning(f"Failed to load backup {backup_path}: {e}")
                continue

        if not valid_backups:
            logger.debug(f"No valid backups found for post {post_id} with restored={restored}")
            return None

        # Sort by timestamp descending and return most recent
        valid_backups.sort(key=lambda x: x.get("timestamp", 0), reverse=True)
        return valid_backups[0]

    def mark_restored(self, post_id: int, timestamp: int) -> bool:
        """
        Mark a backup as restored.

        Args:
            post_id: WordPress post ID
            timestamp: Backup timestamp

        Returns:
            True if successful, False otherwise
        """
        filename = f"post_{post_id}_{timestamp}.json"
        filepath = self.backup_dir / filename

        if not filepath.exists():
            logger.warning(f"Backup file not found: {filepath}")
            return False

        try:
            with open(filepath, 'r', encoding='utf-8') as f:
                data = json.load(f)

            data["restored"] = True

            with open(filepath, 'w', encoding='utf-8') as f:
                json.dump(data, f, indent=2, ensure_ascii=False)

            logger.info(f"Marked backup {filepath} as restored")
            return True
        except (json.JSONDecodeError, IOError) as e:
            logger.error(f"Failed to mark backup as restored: {e}")
            return False

    def list_backups(self, post_id: Optional[int] = None) -> List[Dict[str, Any]]:
        """
        List all backups, optionally filtered by post_id.

        Args:
            post_id: Optional post ID to filter by

        Returns:
            List of backup data dicts, sorted by timestamp descending
        """
        if post_id:
            pattern = f"post_{post_id}_*.json"
        else:
            pattern = "post_*.json"

        backups = []
        for backup_path in self.backup_dir.glob(pattern):
            try:
                with open(backup_path, 'r', encoding='utf-8') as f:
                    data = json.load(f)
                    backups.append(data)
            except (json.JSONDecodeError, IOError) as e:
                logger.warning(f"Failed to load backup {backup_path}: {e}")
                continue

        # Sort by timestamp descending
        backups.sort(key=lambda x: x.get("timestamp", 0), reverse=True)
        return backups

    def cleanup_old_backups(self, max_age_hours: int = 24 * 7) -> int:
        """
        Remove backups older than max_age_hours.

        Args:
            max_age_hours: Maximum age in hours (default: 1 week)

        Returns:
            Number of backups removed
        """
        cutoff = int(time.time()) - (max_age_hours * 3600)
        removed = 0

        for backup_path in self.backup_dir.glob("post_*.json"):
            try:
                with open(backup_path, 'r', encoding='utf-8') as f:
                    data = json.load(f)

                if data.get("timestamp", 0) < cutoff:
                    backup_path.unlink()
                    removed += 1
                    logger.debug(f"Removed old backup: {backup_path}")
            except (json.JSONDecodeError, IOError) as e:
                logger.warning(f"Failed to process backup {backup_path}: {e}")
                continue

        if removed > 0:
            logger.info(f"Cleaned up {removed} old backups")
        return removed


def validate_proposal_safety(
    proposal: Dict[str, Any],
    config: Optional[SafetyConfig] = None
) -> Tuple[bool, str]:
    """
    Validate a proposal against safety rules.

    Args:
        proposal: Proposal dict with 'confidence' and 'content' keys
        config: SafetyConfig instance, uses defaults if None

    Returns:
        Tuple of (is_safe: bool, reason: str)
    """
    config = config or SafetyConfig()

    # Check confidence threshold
    confidence = proposal.get("confidence", 0.0)
    if confidence < config.min_confidence:
        return (
            False,
            f"Confidence {confidence:.2f} below minimum {config.min_confidence}"
        )

    # Check content length (must have meaningful content)
    content = proposal.get("content", "")
    if len(content.strip()) < 50:
        return (
            False,
            f"Content too short: {len(content.strip())} chars (minimum 50)"
        )

    # Check for reasonable content length (max 100KB)
    if len(content) > 100 * 1024:
        return (
            False,
            f"Content too long: {len(content)} chars (maximum 100KB)"
        )

    return (True, "Proposal passes safety validation")


# Convenience function for creating default config
def create_default_safety_config(require_backup: bool = True) -> SafetyConfig:
    """Create a SafetyConfig with default conservative settings."""
    return SafetyConfig(
        require_backup=require_backup,
        min_confidence=0.7,
        backup_dir="/tmp/wp_evolution_backups",
        max_modifications_per_hour=10
    )


if __name__ == "__main__":
    # Quick test
    config = SafetyConfig()
    backup = ContentBackup(config)

    # Test save
    path = backup.save(post_id=1, content="Test content")
    print(f"Saved backup to: {path}")

    # Test load
    data = backup.load(post_id=1)
    if data:
        print(f"Loaded backup: post_id={data['post_id']}, timestamp={data['timestamp']}")

    # Test validation
    proposal = {"confidence": 0.8, "content": "This is a test proposal with enough content."}
    is_safe, reason = validate_proposal_safety(proposal, config)
    print(f"Validation: is_safe={is_safe}, reason={reason}")
