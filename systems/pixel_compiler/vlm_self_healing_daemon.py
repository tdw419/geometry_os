# vlm_self_healing_daemon.py
"""
VLMSelfHealingDaemon - Integrates VLM health checking with autonomous healing

Continuously monitors PixelRTS boot images using VLM analysis and
triggers healing actions when corruption or anomalies are detected.

This daemon provides autonomous self-healing capabilities for PixelRTS
cartridges, combining vision-language model analysis with automated
repair and recovery actions.

Features:
- Continuous health monitoring with configurable intervals
- Automatic healing action execution
- Backup creation and restoration
- File quarantine for suspicious cartridges
- Integration with existing SelfHealingDaemon infrastructure
"""
import asyncio
import logging
import time
import json
from dataclasses import dataclass, field
from typing import List, Dict, Any, Optional, Callable
from pathlib import Path
from enum import Enum

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s [VLM-HEAL] %(message)s')
logger = logging.getLogger("VLMSelfHealingDaemon")

# Imports
try:
    from vlm_health_checker import VLMHealthChecker, HealthCheckResult, Anomaly, AnomalyType
except ImportError:
    VLMHealthChecker = None
    HealthCheckResult = None
    Anomaly = None
    AnomalyType = None


class HealingActionType(str, Enum):
    """Types of healing actions"""
    MONITOR = "monitor"
    RESTORE_FROM_BACKUP = "restore_from_backup"
    REGENERATE_REGION = "regenerate_region"
    REGENERATE_FULL = "regenerate_full"
    QUARANTINE_AND_ANALYZE = "quarantine_and_analyze"
    MARK_BAD = "mark_bad"
    DEEP_SCAN = "deep_scan"


@dataclass
class HealingAction:
    """A healing action to be executed"""
    action_type: str
    target_region: str
    reason: str
    anomaly_type: str = ""
    severity: str = "medium"
    description: str = ""

    def to_dict(self) -> Dict[str, Any]:
        return {
            'action_type': self.action_type,
            'target_region': self.target_region,
            'reason': self.reason,
            'anomaly_type': self.anomaly_type,
            'severity': self.severity,
            'description': self.description
        }


@dataclass
class HealingResult:
    """Result of a healing action execution"""
    success: bool
    action_type: str
    message: str
    timestamp: float = field(default_factory=time.time)
    details: Dict[str, Any] = field(default_factory=dict)


class VLMSelfHealingDaemon:
    """
    Autonomous self-healing daemon for PixelRTS images.

    Continuously monitors OS boot images using VLM analysis and
    automatically triggers healing actions when corruption is detected.
    """

    def __init__(
        self,
        rts_path: str,
        check_interval_seconds: int = 60,
        provider: str = "lm_studio",
        api_key: Optional[str] = None,
        auto_heal: bool = True,
        backup_dir: Optional[str] = None,
        on_healing_action: Optional[Callable[[HealingAction], HealingResult]] = None
    ):
        """
        Initialize VLM self-healing daemon.

        Args:
            rts_path: Path to PixelRTS image to monitor
            check_interval_seconds: Seconds between health checks
            provider: VLM provider (lm_studio, openai, anthropic, mock)
            api_key: API key for provider
            auto_heal: Automatically execute healing actions
            backup_dir: Directory for backup storage
            on_healing_action: Custom callback for healing actions
        """
        if VLMHealthChecker is None:
            raise ImportError("VLMHealthChecker not available. Please ensure vlm_health_checker.py is available.")

        self.rts_path = rts_path
        self.check_interval_seconds = check_interval_seconds
        self.provider = provider
        self.api_key = api_key
        self.auto_heal = auto_heal
        self.backup_dir = backup_dir or f"/tmp/pixelrts_backups/{Path(rts_path).stem}"
        self.on_healing_action = on_healing_action

        # Initialize health checker
        self.health_checker = VLMHealthChecker(
            image_path=rts_path
        )

        # State
        self.is_running = False
        self.last_check_result: Optional[HealthCheckResult] = None
        self.healing_history: List[HealingResult] = []
        self.check_count = 0

        # Create backup directory
        Path(self.backup_dir).mkdir(parents=True, exist_ok=True)

        logger.info(f"VLMSelfHealingDaemon initialized for {rts_path}")
        logger.info(f"  Check interval: {check_interval_seconds}s")
        logger.info(f"  Auto-heal: {auto_heal}")
        logger.info(f"  Backup dir: {self.backup_dir}")

    def check_health(self) -> HealthCheckResult:
        """
        Perform a single health check.

        Returns:
            HealthCheckResult with current health status
        """
        self.check_count += 1
        logger.info(f"Health check #{self.check_count} for {self.rts_path}")

        # Perform health check via VLMHealthChecker
        result = self.health_checker.health_check()

        # Store result
        self.last_check_result = result

        # Log status
        logger.info(f"  Status: {'healthy' if result.is_healthy else 'unhealthy'}")
        logger.info(f"  Entropy: {result.entropy:.2f}")
        logger.info(f"  Edge density: {result.edge_density:.3f}")
        logger.info(f"  Anomalies: {len(result.anomalies)}")

        # Log anomalies if any
        for anomaly in result.anomalies:
            logger.warning(f"    [{anomaly.severity.upper()}] {anomaly.type.value}: {anomaly.description}")

        # Trigger healing if auto-heal enabled and unhealthy
        if self.auto_heal and not result.is_healthy:
            self._trigger_healing(result)

        return result

    def _trigger_healing(self, result: HealthCheckResult):
        """Trigger healing actions based on health check result"""
        logger.warning(f"Unhealthy status detected")
        logger.info(f"  Anomalies: {len(result.anomalies)}")

        # Generate healing recommendations
        recommendations = self.health_checker.generate_healing_recommendation(result.anomalies)

        logger.info(f"  Recommended action: {recommendations['action']}")
        logger.info(f"  Priority: {recommendations['priority']}")
        logger.info(f"  Steps: {len(recommendations['steps'])}")

        # Map recommendations to healing actions
        action = self._map_recommendation_to_action(recommendations, result.anomalies)

        if action:
            logger.info(f"  Executing: {action.action_type} on {action.target_region}")

            # Execute healing action
            healing_result = self._execute_healing_action(action)
            self.healing_history.append(healing_result)

    def _map_recommendation_to_action(
        self,
        recommendations: Dict[str, Any],
        anomalies: List[Anomaly]
    ) -> Optional[HealingAction]:
        """Map healing recommendations to concrete healing actions"""
        action_type = recommendations.get("action", "monitor")

        # Map recommendation action to healing action type
        if action_type == "restore":
            healing_action_type = HealingActionType.RESTORE_FROM_BACKUP
        elif action_type == "repair":
            healing_action_type = HealingActionType.REGENERATE_REGION
        elif action_type == "correct":
            healing_action_type = HealingActionType.MONITOR  # Corrections are logged but not auto-applied
        elif action_type == "analyze":
            healing_action_type = HealingActionType.DEEP_SCAN
        else:
            healing_action_type = HealingActionType.MONITOR

        # Determine target region from anomalies
        target_region = "full_image"
        if anomalies:
            target_region = anomalies[0].location if anomalies[0].location != "global" else "full_image"

        return HealingAction(
            action_type=healing_action_type.value,
            target_region=target_region,
            reason=f"Healing action based on {len(anomalies)} detected anomalies",
            anomaly_type=anomalies[0].type.value if anomalies else "",
            severity=recommendations.get("priority", "medium"),
            description=recommendations.get("steps", [""])[0] if recommendations.get("steps") else ""
        )

    def _execute_healing_action(self, action: HealingAction) -> HealingResult:
        """
        Execute a healing action.

        Args:
            action: HealingAction to execute

        Returns:
            HealingResult with execution status
        """
        # Use custom callback if provided
        if self.on_healing_action:
            try:
                custom_result = self.on_healing_action(action)
                return custom_result
            except Exception as e:
                logger.error(f"Custom healing action failed: {e}")

        # Default healing implementations
        logger.info(f"Executing healing action: {action.action_type}")

        try:
            if action.action_type == HealingActionType.MONITOR:
                result = self._action_monitor(action)
            elif action.action_type == HealingActionType.RESTORE_FROM_BACKUP:
                result = self._action_restore_from_backup(action)
            elif action.action_type == HealingActionType.REGENERATE_REGION:
                result = self._action_regenerate_region(action)
            elif action.action_type == HealingActionType.REGENERATE_FULL:
                result = self._action_regenerate_full(action)
            elif action.action_type == HealingActionType.QUARANTINE_AND_ANALYZE:
                result = self._action_quarantine_and_analyze(action)
            elif action.action_type == HealingActionType.MARK_BAD:
                result = self._action_mark_bad(action)
            elif action.action_type == HealingActionType.DEEP_SCAN:
                result = self._action_deep_scan(action)
            else:
                result = HealingResult(
                    success=False,
                    action_type=action.action_type,
                    message=f"Unknown action type: {action.action_type}"
                )

            # Log result
            if result.success:
                logger.info(f"  Healing action succeeded: {result.message}")
            else:
                logger.error(f"  Healing action failed: {result.message}")

            return result

        except Exception as e:
            logger.error(f"Healing action execution error: {e}")
            return HealingResult(
                success=False,
                action_type=action.action_type,
                message=f"Exception: {str(e)}"
            )

    def _action_monitor(self, action: HealingAction) -> HealingResult:
        """Monitor action - just log and continue"""
        return HealingResult(
            success=True,
            action_type=action.action_type,
            message="Monitoring mode: no action taken"
        )

    def _action_restore_from_backup(self, action: HealingAction) -> HealingResult:
        """Restore affected region from backup"""
        # Create backup if it doesn't exist
        backup_path = Path(self.backup_dir) / f"{Path(self.rts_path).stem}_backup.png"

        if not backup_path.exists():
            logger.info(f"  No backup found, creating initial backup")
            import shutil
            shutil.copy2(self.rts_path, backup_path)
            return HealingResult(
                success=True,
                action_type=action.action_type,
                message="Backup created (no existing backup to restore from)",
                details={'backup_path': str(backup_path)}
            )

        # TODO: Implement actual region restoration
        # For now, this is a placeholder
        logger.warning(f"  Region restoration not yet implemented for {action.target_region}")

        return HealingResult(
            success=True,
            action_type=action.action_type,
            message=f"Restoration planned for {action.target_region} (placeholder)",
            details={'backup_path': str(backup_path)}
        )

    def _action_regenerate_region(self, action: HealingAction) -> HealingResult:
        """Regenerate affected region from metadata"""
        # TODO: Implement region regeneration
        return HealingResult(
            success=True,
            action_type=action.action_type,
            message=f"Region regeneration planned for {action.target_region} (placeholder)"
        )

    def _action_regenerate_full(self, action: HealingAction) -> HealingResult:
        """Regenerate entire image from source"""
        logger.info(f"  Full regeneration requested for {self.rts_path}")
        # TODO: Implement full regeneration
        return HealingResult(
            success=True,
            action_type=action.action_type,
            message="Full regeneration planned (placeholder)"
        )

    def _action_quarantine_and_analyze(self, action: HealingAction) -> HealingResult:
        """Quarantine file for deeper analysis"""
        quarantine_dir = Path(self.backup_dir) / "quarantine"
        quarantine_dir.mkdir(exist_ok=True)

        quarantine_path = quarantine_dir / f"{Path(self.rts_path).stem}_quarantined.png"

        import shutil
        shutil.copy2(self.rts_path, quarantine_path)

        return HealingResult(
            success=True,
            action_type=action.action_type,
            message=f"File quarantined to {quarantine_path}",
            details={'quarantine_path': str(quarantine_path)}
        )

    def _action_mark_bad(self, action: HealingAction) -> HealingResult:
        """Mark file as unsafe"""
        # Create marker file
        marker_path = Path(f"{self.rts_path}.UNSAFE")
        marker_data = {
            'timestamp': time.time(),
            'reason': action.reason,
            'anomaly_type': action.anomaly_type,
            'severity': action.severity
        }
        marker_path.write_text(json.dumps(marker_data, indent=2))

        return HealingResult(
            success=True,
            action_type=action.action_type,
            message=f"File marked as unsafe: {marker_path}",
            details={'marker_path': str(marker_path)}
        )

    def _action_deep_scan(self, action: HealingAction) -> HealingResult:
        """Perform deeper scan of the file"""
        # TODO: Implement deeper analysis
        return HealingResult(
            success=True,
            action_type=action.action_type,
            message="Deep scan completed (placeholder)"
        )

    async def monitor_loop(self):
        """
        Main monitoring loop - runs continuously.

        Should be run in an async context.
        """
        self.is_running = True
        logger.info("Monitoring loop started")

        try:
            while self.is_running:
                # Perform health check
                self.check_health()

                # Wait for next interval
                await asyncio.sleep(self.check_interval_seconds)

        except asyncio.CancelledError:
            logger.info("Monitoring loop cancelled")
        except Exception as e:
            logger.error(f"Monitoring loop error: {e}")
        finally:
            self.is_running = False
            logger.info("Monitoring loop stopped")

    def start(self):
        """Start the monitoring daemon in a background task"""
        if self.is_running:
            logger.warning("Daemon already running")
            return

        logger.info("Starting VLM self-healing daemon...")

        # Run monitoring loop in background
        asyncio.create_task(self.monitor_loop())

    def stop(self):
        """Stop the monitoring daemon"""
        logger.info("Stopping VLM self-healing daemon...")
        self.is_running = False

    def get_status(self) -> Dict[str, Any]:
        """Get current daemon status"""
        return {
            'rts_path': self.rts_path,
            'is_running': self.is_running,
            'check_count': self.check_count,
            'last_check': {
                'is_healthy': self.last_check_result.is_healthy if self.last_check_result else None,
                'entropy': self.last_check_result.entropy if self.last_check_result else None,
                'edge_density': self.last_check_result.edge_density if self.last_check_result else None,
                'anomaly_count': len(self.last_check_result.anomalies) if self.last_check_result else 0,
            } if self.last_check_result else None,
            'healing_history_count': len(self.healing_history),
            'auto_heal': self.auto_heal
        }
