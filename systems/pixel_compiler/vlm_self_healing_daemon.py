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

        # Parse target region (format: "x,y,w,h" or "full")
        try:
            from PIL import Image

            current_img = Image.open(self.rts_path)
            backup_img = Image.open(backup_path)

            if action.target_region == "full" or not action.target_region:
                # Full restoration
                backup_img.save(self.rts_path)
                return HealingResult(
                    success=True,
                    action_type=action.action_type,
                    message="Full image restored from backup",
                    details={'backup_path': str(backup_path)}
                )

            # Parse region coordinates
            parts = action.target_region.split(',')
            if len(parts) == 4:
                x, y, w, h = map(int, parts)
                # Extract region from backup
                region = backup_img.crop((x, y, x + w, y + h))
                # Paste into current image
                current_img.paste(region, (x, y))
                current_img.save(self.rts_path)

                return HealingResult(
                    success=True,
                    action_type=action.action_type,
                    message=f"Region ({x},{y},{w},{h}) restored from backup",
                    details={'backup_path': str(backup_path), 'region': action.target_region}
                )
            else:
                logger.warning(f"  Invalid region format: {action.target_region}")
                return HealingResult(
                    success=False,
                    action_type=action.action_type,
                    message=f"Invalid region format: {action.target_region}",
                    details={'expected': 'x,y,w,h'}
                )

        except ImportError:
            logger.warning("PIL not available, falling back to file copy")
            import shutil
            shutil.copy2(backup_path, self.rts_path)
            return HealingResult(
                success=True,
                action_type=action.action_type,
                message="Full file restored from backup (PIL unavailable)",
                details={'backup_path': str(backup_path)}
            )
        except Exception as e:
            logger.error(f"  Region restoration failed: {e}")
            return HealingResult(
                success=False,
                action_type=action.action_type,
                message=f"Restoration failed: {e}",
                details={'error': str(e)}
            )

    def _action_regenerate_region(self, action: HealingAction) -> HealingResult:
        """Regenerate affected region from metadata"""
        try:
            from PIL import Image

            # Load the RTS image
            img = Image.open(self.rts_path)
            metadata_path = Path(f"{self.rts_path}.json")

            if not metadata_path.exists():
                return HealingResult(
                    success=False,
                    action_type=action.action_type,
                    message="No metadata file found for regeneration",
                    details={'expected_metadata': str(metadata_path)}
                )

            # Load metadata
            with open(metadata_path) as f:
                metadata = json.load(f)

            # Parse region coordinates
            if action.target_region == "full" or not action.target_region:
                return self._action_regenerate_full(action)

            parts = action.target_region.split(',')
            if len(parts) != 4:
                return HealingResult(
                    success=False,
                    action_type=action.action_type,
                    message=f"Invalid region format: {action.target_region}",
                    details={'expected': 'x,y,w,h'}
                )

            x, y, w, h = map(int, parts)

            # Look for region source in metadata
            regions = metadata.get('regions', {})
            region_key = f"{x}_{y}_{w}_{h}"

            if region_key in regions:
                region_info = regions[region_key]
                # Regenerate from source if available
                source_path = region_info.get('source_path')
                if source_path and Path(source_path).exists():
                    source_img = Image.open(source_path)
                    sx, sy, sw, sh = region_info.get('source_rect', (0, 0, w, h))
                    source_region = source_img.crop((sx, sy, sx + sw, sy + sh))
                    source_region = source_region.resize((w, h))
                    img.paste(source_region, (x, y))
                    img.save(self.rts_path)

                    return HealingResult(
                        success=True,
                        action_type=action.action_type,
                        message=f"Region regenerated from source: {source_path}",
                        details={'region': action.target_region, 'source': source_path}
                    )

            # Fallback: fill with neutral color
            from PIL import ImageDraw
            draw = ImageDraw.Draw(img)
            draw.rectangle([x, y, x + w, y + h], fill=(128, 128, 128))
            img.save(self.rts_path)

            return HealingResult(
                success=True,
                action_type=action.action_type,
                message=f"Region filled with placeholder (no source in metadata)",
                details={'region': action.target_region}
            )

        except ImportError:
            return HealingResult(
                success=False,
                action_type=action.action_type,
                message="PIL not available for region regeneration"
            )
        except Exception as e:
            logger.error(f"  Region regeneration failed: {e}")
            return HealingResult(
                success=False,
                action_type=action.action_type,
                message=f"Regeneration failed: {e}",
                details={'error': str(e)}
            )

    def _action_regenerate_full(self, action: HealingAction) -> HealingResult:
        """Regenerate entire image from source"""
        logger.info(f"  Full regeneration requested for {self.rts_path}")

        try:
            metadata_path = Path(f"{self.rts_path}.json")

            if not metadata_path.exists():
                return HealingResult(
                    success=False,
                    action_type=action.action_type,
                    message="No metadata file found for full regeneration",
                    details={'expected_metadata': str(metadata_path)}
                )

            with open(metadata_path) as f:
                metadata = json.load(f)

            # Look for source image in metadata
            source_path = metadata.get('source_path')
            if not source_path:
                # Try alternate keys
                source_path = metadata.get('original_source') or metadata.get('source_image')

            if source_path and Path(source_path).exists():
                from PIL import Image
                import shutil

                # Copy source to RTS path
                shutil.copy2(source_path, self.rts_path)

                # Apply any transformations from metadata
                if 'transformations' in metadata:
                    img = Image.open(self.rts_path)
                    for transform in metadata['transformations']:
                        t_type = transform.get('type')
                        if t_type == 'resize':
                            img = img.resize(tuple(transform.get('size', img.size)))
                        elif t_type == 'crop':
                            box = transform.get('box')
                            if box:
                                img = img.crop(tuple(box))
                    img.save(self.rts_path)

                return HealingResult(
                    success=True,
                    action_type=action.action_type,
                    message=f"Full image regenerated from source: {source_path}",
                    details={'source_path': source_path}
                )

            return HealingResult(
                success=False,
                action_type=action.action_type,
                message="No source path found in metadata for regeneration",
                details={'metadata_keys': list(metadata.keys())}
            )

        except Exception as e:
            logger.error(f"  Full regeneration failed: {e}")
            return HealingResult(
                success=False,
                action_type=action.action_type,
                message=f"Full regeneration failed: {e}",
                details={'error': str(e)}
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
        try:
            from PIL import Image
            import hashlib

            findings = []

            # Load image for analysis
            img = Image.open(self.rts_path)
            width, height = img.size

            # 1. Check for uniform regions (potential corruption)
            if img.mode in ('RGB', 'RGBA'):
                pixels = list(img.getdata())
                unique_colors = len(set(pixels[:min(10000, len(pixels))]))
                if unique_colors < 10:
                    findings.append(f"Low color diversity: only {unique_colors} unique colors in sample")

            # 2. Check image dimensions are reasonable
            if width > 8192 or height > 8192:
                findings.append(f"Unusual dimensions: {width}x{height}")
            if width < 8 or height < 8:
                findings.append(f"Suspiciously small: {width}x{height}")

            # 3. Check file integrity via hash
            with open(self.rts_path, 'rb') as f:
                file_hash = hashlib.md5(f.read()).hexdigest()

            # 4. Check metadata consistency
            metadata_path = Path(f"{self.rts_path}.json")
            metadata_status = "not_found"
            if metadata_path.exists():
                with open(metadata_path) as f:
                    metadata = json.load(f)
                metadata_status = "valid"
                # Check if dimensions match
                if 'width' in metadata and 'height' in metadata:
                    if metadata['width'] != width or metadata['height'] != height:
                        findings.append(f"Dimension mismatch: metadata says {metadata['width']}x{metadata['height']}, actual is {width}x{height}")

            # 5. Statistical analysis of pixel distribution
            if img.mode == 'RGB':
                r_vals = [p[0] for p in pixels[:min(10000, len(pixels))]]
                g_vals = [p[1] for p in pixels[:min(10000, len(pixels))]]
                b_vals = [p[2] for p in pixels[:min(10000, len(pixels))]]

                # Check for channel imbalance
                r_avg = sum(r_vals) / len(r_vals)
                g_avg = sum(g_vals) / len(g_vals)
                b_avg = sum(b_vals) / len(b_vals)

                if abs(r_avg - g_avg) > 100 or abs(r_avg - b_avg) > 100 or abs(g_avg - b_avg) > 100:
                    findings.append(f"Channel imbalance detected: R={r_avg:.1f}, G={g_avg:.1f}, B={b_avg:.1f}")

            result_message = f"Deep scan completed. Hash: {file_hash[:8]}..."
            if findings:
                result_message += f" Findings: {'; '.join(findings)}"

            return HealingResult(
                success=True,
                action_type=action.action_type,
                message=result_message,
                details={
                    'hash': file_hash,
                    'dimensions': f"{width}x{height}",
                    'mode': img.mode,
                    'metadata_status': metadata_status,
                    'findings': findings,
                    'unique_colors_sample': unique_colors if 'unique_colors' in dir() else None
                }
            )

        except ImportError:
            return HealingResult(
                success=False,
                action_type=action.action_type,
                message="PIL not available for deep scan"
            )
        except Exception as e:
            logger.error(f"  Deep scan failed: {e}")
            return HealingResult(
                success=False,
                action_type=action.action_type,
                message=f"Deep scan failed: {e}",
                details={'error': str(e)}
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
