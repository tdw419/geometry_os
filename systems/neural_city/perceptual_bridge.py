#!/usr/bin/env python3
"""
Perceptual Bridge V16 - Visual Anomaly Detection for Geometry OS.

The "Retina" that closes the cognitive feedback loop for autonomous
binary generation. Detects kernel panics, errors, and frozen states
in the Silicon District framebuffer.

Usage:
    bridge = PerceptualBridge(ws_url="ws://localhost:8768")
    await bridge.start()
"""

import asyncio
import json
import time
import re
from dataclasses import dataclass, field
from enum import Enum
from typing import Optional, List, Dict, Any
import websockets


class DiagnosticStatus(Enum):
    """Health status levels for the Silicon District."""
    HEALTHY = "HEALTHY"
    WARNING = "WARNING"
    CRITICAL = "CRITICAL"


@dataclass
class AnomalyResult:
    """Result of an anomaly scan."""
    status: DiagnosticStatus = DiagnosticStatus.HEALTHY
    matched_pattern: str = ""
    detected_text: str = ""
    timestamp: float = field(default_factory=time.time)


class AnomalyDetector:
    """
    Scans text for anomaly patterns (panics, errors, bugs).

    Patterns are prioritized by severity:
    - CRITICAL: kernel panic, segfault, call trace
    - WARNING: error, fail, bug
    """

    CRITICAL_PATTERNS = [
        r"kernel\s+panic",
        r"call\s+trace",
        r"segfault",
        r"segmentation\s+fault",
        r"general\s+protection\s+fault",
        r"not\s+syncing",
        r"unable\s+to\s+mount",
    ]

    WARNING_PATTERNS = [
        r"error\s*:",
        r"failed",
        r"failure",
        r"bug\s*:",
        r"warning\s*:",
        r"exception",
    ]

    def __init__(self):
        """Initialize pattern matchers."""
        self._critical_re = [
            re.compile(p, re.IGNORECASE) for p in self.CRITICAL_PATTERNS
        ]
        self._warning_re = [
            re.compile(p, re.IGNORECASE) for p in self.WARNING_PATTERNS
        ]

    def scan(self, text: str) -> AnomalyResult:
        """
        Scan text for anomaly patterns.

        Args:
            text: Text to scan (e.g., OCR output from framebuffer)

        Returns:
            AnomalyResult with status and matched pattern
        """
        if not text or not text.strip():
            return AnomalyResult(status=DiagnosticStatus.HEALTHY)

        # Check CRITICAL patterns first
        for pattern in self._critical_re:
            match = pattern.search(text)
            if match:
                return AnomalyResult(
                    status=DiagnosticStatus.CRITICAL,
                    matched_pattern=match.group(),
                    detected_text=text[:500]  # Truncate for storage
                )

        # Check WARNING patterns
        for pattern in self._warning_re:
            match = pattern.search(text)
            if match:
                return AnomalyResult(
                    status=DiagnosticStatus.WARNING,
                    matched_pattern=match.group(),
                    detected_text=text[:500]
                )

        return AnomalyResult(
            status=DiagnosticStatus.HEALTHY,
            detected_text=text[:500]
        )


class PerceptualBridge:
    """
    Background daemon that monitors the Silicon District framebuffer
    and emits DIAGNOSTIC_PULSE events.

    Flow:
        1. Capture framebuffer snapshot
        2. Run OCR via ExtractionPipeline
        3. Scan for anomalies
        4. Broadcast DIAGNOSTIC_PULSE to VisualBridge
    """

    def __init__(
        self,
        ws_url: str = "ws://localhost:8768",
        district_id: str = "silicon",
        scan_interval: float = 2.0,
        freeze_threshold: float = 5.0
    ):
        """
        Initialize the Perceptual Bridge.

        Args:
            ws_url: WebSocket URL for VisualBridge
            district_id: District to monitor
            scan_interval: Seconds between scans
            freeze_threshold: Seconds before PC freeze is CRITICAL
        """
        self.ws_url = ws_url
        self.district_id = district_id
        self.scan_interval = scan_interval
        self.freeze_threshold = freeze_threshold

        self.detector = AnomalyDetector()
        self._running = False
        self._ws = None

        # PC tracking for freeze detection
        self._last_pc: Optional[int] = None
        self._last_pc_time: float = 0.0

    async def start(self):
        """Start the monitoring loop."""
        self._running = True
        print(f"🔮 Perceptual Bridge V16 starting...")
        print(f"   District: {self.district_id}")
        print(f"   Interval: {self.scan_interval}s")

        while self._running:
            try:
                await self._scan_cycle()
                await asyncio.sleep(self.scan_interval)
            except asyncio.CancelledError:
                break
            except Exception as e:
                print(f"⚠️  Perceptual Bridge error: {e}")
                await asyncio.sleep(5.0)  # Back off on error

    def stop(self):
        """Stop the monitoring loop."""
        self._running = False

    async def _scan_cycle(self):
        """Execute one scan cycle: capture -> OCR -> detect -> broadcast."""
        # 1. Capture framebuffer (placeholder - actual capture from RISC-V VM)
        text = await self._capture_text()

        # 2. Scan for anomalies
        result = self.detector.scan(text)

        # 3. Check for PC freeze
        freeze_status = await self._check_freeze()
        if freeze_status == "CRITICAL":
            result.status = DiagnosticStatus.CRITICAL
            result.matched_pattern = "PC_FROZEN"

        # 4. Broadcast DIAGNOSTIC_PULSE
        await self._broadcast_pulse(result)

    async def _capture_text(self) -> str:
        """
        Capture text from the Silicon District framebuffer.

        Uses ExtractionPipeline for OCR if image available,
        otherwise reads from UART buffer or returns empty.
        """
        # Placeholder: In production, this would:
        # 1. Capture framebuffer from RISC-V VM
        # 2. Run through ExtractionPipeline.OCR
        # For now, return empty (will be fed by riscv_uart events)
        return ""

    async def _check_freeze(self) -> str:
        """
        Check if the program counter has frozen.

        Returns:
            "CRITICAL" if frozen beyond threshold, else "HEALTHY"
        """
        # Placeholder: In production, track riscv_state events
        return "HEALTHY"

    async def _broadcast_pulse(self, result: AnomalyResult):
        """Broadcast DIAGNOSTIC_PULSE event to VisualBridge."""
        pulse = {
            "type": "DIAGNOSTIC_PULSE",
            "district_id": self.district_id,
            "status": result.status.value,
            "matched_pattern": result.matched_pattern,
            "detected_text": result.detected_text[:200],
            "timestamp": result.timestamp
        }

        try:
            async with websockets.connect(self.ws_url) as ws:
                await ws.send(json.dumps(pulse))

                # Log status changes
                if result.status != DiagnosticStatus.HEALTHY:
                    print(f"⚠️  DIAGNOSTIC_PULSE: {result.status.value}")
                    print(f"   Pattern: {result.matched_pattern}")
        except Exception as e:
            print(f"⚠️  Failed to broadcast pulse: {e}")


# CLI entry point
if __name__ == "__main__":
    bridge = PerceptualBridge()
    try:
        asyncio.run(bridge.start())
    except KeyboardInterrupt:
        print("\n🛑 Perceptual Bridge stopped")
