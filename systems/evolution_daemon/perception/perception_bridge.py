"""
Perception Bridge

Connects the NeuralPerceptionKernel (JavaScript/WebGPU) with the
Evolution Daemon (Python) for autonomous system monitoring.

Communication:
- Bridge calls kernel via HTTP/WebSocket
- Kernel returns perception results
- Bridge triggers Evolution Daemon actions based on results
"""

import asyncio
import json
import logging
from dataclasses import dataclass, field
from typing import Dict, List, Any, Optional, Callable, Awaitable
import numpy as np

logger = logging.getLogger("evolution_daemon.perception_bridge")


@dataclass
class PerceptionConfig:
    """Configuration for the perception bridge."""
    patch_size: int = 16
    fracture_threshold: float = 0.3  # % of fractures to trigger alert
    scan_interval_ms: int = 1000
    api_endpoint: str = "http://localhost:8080/api/perception"


@dataclass
class PerceptionResult:
    """Result of a perception scan."""
    total_patches: int
    code_patches: int
    data_patches: int
    fracture_patches: int
    noise_patches: int
    hotspots: List[Dict[str, Any]] = field(default_factory=list)

    @property
    def fracture_ratio(self) -> float:
        if self.total_patches == 0:
            return 0.0
        return self.fracture_patches / self.total_patches


class PerceptionBridge:
    """
    Bridge between NeuralPerceptionKernel and Evolution Daemon.

    Usage:
        bridge = PerceptionBridge()
        await bridge.start()

        # Analyze RTS data
        result = await bridge.analyze_region(rts_bytes, width, height)

        # Check for fractures
        if result.fracture_ratio > 0.3:
            await trigger_healing()
    """

    def __init__(self, config: Optional[PerceptionConfig] = None):
        self.config = config or PerceptionConfig()
        self.kernel = self._create_kernel()
        self._evolution_callback: Optional[Callable] = None
        self._running = False

        logger.info("PerceptionBridge initialized")

    def _create_kernel(self):
        """Create a local kernel instance for CPU fallback."""
        # Import the CPU-only kernel implementation
        from . import neural_kernel_cpu
        return neural_kernel_cpu.NeuralKernelCPU(
            patch_size=self.config.patch_size
        )

    def set_evolution_callback(self, callback: Callable):
        """Set callback for Evolution Daemon notifications."""
        self._evolution_callback = callback

    async def analyze_region(
        self,
        data: bytes,
        width: int,
        height: int
    ) -> PerceptionResult:
        """
        Analyze an RTS region for patterns and fractures.

        Args:
            data: RGBA pixel data (width * height * 4 bytes)
            width: Region width in pixels
            height: Region height in pixels

        Returns:
            PerceptionResult with classification summary
        """
        logger.debug(f"Analyzing region: {width}x{height}")

        # Convert bytes to numpy array
        pixels = np.frombuffer(data, dtype=np.uint8)
        pixels = pixels.reshape((height, width, 4))

        # Scan patches
        patch_size = self.config.patch_size
        patches = []
        hotspots = []

        counts = {
            'code': 0,
            'data': 0,
            'fracture': 0,
            'noise': 0,
            'unknown': 0
        }

        for y in range(0, height - patch_size, patch_size):
            for x in range(0, width - patch_size, patch_size):
                # Extract patch
                patch = pixels[y:y+patch_size, x:x+patch_size]
                patch_bytes = patch.tobytes()

                # Classify
                result = self.kernel.classify(patch_bytes)

                counts[result['type']] += 1

                patches.append({
                    'x': x,
                    'y': y,
                    'type': result['type'],
                    'confidence': result['confidence']
                })

                # Track hotspots
                if result['type'] == 'fracture' or result['confidence'] > 0.8:
                    hotspots.append({
                        'x': x,
                        'y': y,
                        'type': result['type'],
                        'confidence': result['confidence']
                    })

        total = sum(counts.values())

        result = PerceptionResult(
            total_patches=total,
            code_patches=counts['code'],
            data_patches=counts['data'],
            fracture_patches=counts['fracture'],
            noise_patches=counts['noise'],
            hotspots=hotspots
        )

        logger.debug(f"Analysis complete: {counts}")

        return result

    async def analyze_and_report(
        self,
        data: bytes,
        width: int,
        height: int
    ) -> PerceptionResult:
        """
        Analyze region and report to Evolution Daemon if configured.
        """
        result = await self.analyze_region(data, width, height)

        # Check fracture threshold
        if result.fracture_ratio >= self.config.fracture_threshold:
            logger.warning(
                f"Fracture threshold exceeded: {result.fracture_ratio:.1%}"
            )

            if self._evolution_callback:
                await self._evolution_callback({
                    'type': 'fracture_detected',
                    'ratio': result.fracture_ratio,
                    'hotspots': result.hotspots[:10]  # Top 10
                })

        return result

    async def start_periodic_scan(
        self,
        get_rts_data: Callable[[], Awaitable[tuple]]
    ):
        """
        Start periodic scanning of RTS data.

        Args:
            get_rts_data: Async function returning (data, width, height)
        """
        self._running = True
        interval = self.config.scan_interval_ms / 1000

        logger.info(f"Starting periodic scan (interval: {interval}s)")

        while self._running:
            try:
                data, width, height = await get_rts_data()
                await self.analyze_and_report(data, width, height)
            except Exception as e:
                logger.error(f"Scan error: {e}")

            await asyncio.sleep(interval)

    def stop(self):
        """Stop periodic scanning."""
        self._running = False
        logger.info("Perception scan stopped")
