"""
Evolution Daemon Bridge
-----------------------
Bridges the gap between the EvolutionProtocolServer (socket layer) and the 
EvolutionDaemonV8 (application logic).

This allows the protocol server to forward messages (like WriteEvolvedGenome)
to the daemon without tight coupling or circular dependencies.
"""

import logging
import queue
import time
from typing import Optional, Dict, Any

logger = logging.getLogger("EvolutionDaemonBridge")

class EvolutionDaemonBridge:
    """
    Bridge between Protocol Server and Evolution Daemon.
    Singleton-like access pattern recommended.
    """
    
    def __init__(self):
        self.daemon_instance = None
        self.genome_queue: Optional[queue.Queue] = None
        logger.info("🌉 Evolution Daemon Bridge initialized")

    def register_daemon(self, daemon):
        """Register the main daemon instance."""
        self.daemon_instance = daemon
        if hasattr(daemon, 'genome_queue'):
            self.genome_queue = daemon.genome_queue
            logger.info("✅ Genome Queue connected to Bridge")
        else:
            logger.warning("⚠️ Daemon does not have 'genome_queue' attribute")

    def forward_genome(self, genome_data: Dict[str, Any]) -> bool:
        """
        Forward an evolved genome to the daemon's processing queue.

        Args:
            genome_data: Dictionary containing genome (id, data, metadata, etc.)

        Returns:
            bool: True if queued successfully, False otherwise
        """
        if not self.genome_queue:
            logger.error("❌ Cannot forward genome: No queue connected (Daemon not registered?)")
            return False

        try:
            self.genome_queue.put(genome_data)
            logger.info(f"➡️ Forwarded genome {genome_data.get('id', 'unknown')} to processing queue")
            return True
        except Exception as e:
            logger.error(f"❌ Error forwarding genome: {e}")
            return False

    # --- VLM HEALTH MONITORING METHODS (Task 4: Evolution Integration) ---

    def trigger_healing(self, rts_path: str, anomaly_data: dict = None) -> dict:
        """
        Trigger healing action for a PixelRTS OS image.

        Args:
            rts_path: Path to .rts.png file to heal
            anomaly_data: Optional anomaly information

        Returns:
            Dictionary with healing result
        """
        logger.info(f"TRIGGER_HEALING: {rts_path}")

        try:
            # Import here to avoid circular imports
            from systems.pixel_compiler.vlm_self_healing_daemon import VLMSelfHealingDaemon

            daemon = VLMSelfHealingDaemon(
                rts_path=rts_path,
                auto_heal=True
            )

            # Perform health check to get recommended actions
            result = daemon.check_health()

            return {
                "success": result.status != "unhealthy",
                "status": result.status,
                "actions_taken": len(daemon.healing_history),
                "anomalies_found": len(result.anomalies)
            }

        except Exception as e:
            logger.error(f"Healing trigger failed: {e}")
            return {
                "success": False,
                "error": str(e)
            }

    def restore_os_health(self, rts_path: str, backup_path: str = None) -> dict:
        """
        Restore OS image to healthy state.

        Args:
            rts_path: Path to .rts.png file to restore
            backup_path: Optional path to backup file

        Returns:
            Dictionary with restoration result
        """
        logger.info(f"RESTORE_OS_HEALTH: {rts_path}")

        try:
            import shutil
            from pathlib import Path

            rts_path = Path(rts_path)

            # Create backup if not provided
            if backup_path is None:
                backup_path = rts_path.parent / f"{rts_path.stem}_backup.png"

            # Check if backup exists
            backup_path = Path(backup_path)
            if not backup_path.exists():
                # Create backup from current (assumed good) state
                logger.info(f"Creating backup: {backup_path}")
                shutil.copy2(rts_path, backup_path)
                return {
                    "success": True,
                    "message": "Backup created (no existing backup to restore from)",
                    "backup_path": str(backup_path)
                }

            # Restore from backup
            logger.info(f"Restoring from backup: {backup_path}")

            # Verify backup is valid before restoring
            if backup_path.stat().st_size == 0:
                return {
                    "success": False,
                    "error": "Backup file is empty",
                    "backup_path": str(backup_path)
                }

            # Create a safety backup of current state before overwriting
            safety_backup = rts_path.parent / f"{rts_path.stem}_pre_restore_{int(time.time())}.png"
            if rts_path.exists():
                shutil.copy2(rts_path, safety_backup)
                logger.info(f"Created safety backup: {safety_backup}")

            # Restore from backup
            shutil.copy2(backup_path, rts_path)

            # Verify restoration succeeded
            if not rts_path.exists():
                return {
                    "success": False,
                    "error": "Restoration failed - file not created",
                    "backup_path": str(backup_path)
                }

            restored_size = rts_path.stat().st_size
            backup_size = backup_path.stat().st_size

            if restored_size != backup_size:
                logger.warning(f"Size mismatch after restore: {restored_size} vs {backup_size}")

            return {
                "success": True,
                "message": f"Restored from backup ({restored_size} bytes)",
                "backup_path": str(backup_path),
                "safety_backup": str(safety_backup) if safety_backup.exists() else None,
                "restored_size": restored_size
            }

        except Exception as e:
            logger.error(f"OS health restoration failed: {e}")
            return {
                "success": False,
                "error": str(e)
            }

# Global instance for easy access
_BRIDGE_INSTANCE = EvolutionDaemonBridge()

def get_bridge() -> EvolutionDaemonBridge:
    return _BRIDGE_INSTANCE
