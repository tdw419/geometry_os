"""
EvolutionDaemonBridge: Connects EvolutionProtocolServer to EvolutionDaemonV8

This module provides the bridge between the socket protocol handler and the
actual evolution daemon instance. It handles:
- Genome forwarding from protocol to daemon
- Daemon instance reference management
- Thread-safe queue operations
"""

import logging
from typing import Optional, TYPE_CHECKING

if TYPE_CHECKING:
    from evolution_daemon_v8 import EvolutionDaemonV8

logger = logging.getLogger(__name__)


class EvolutionDaemonBridge:
    """
    Bridge between EvolutionProtocolServer and EvolutionDaemonV8

    This class exists to avoid circular imports and provide a clean interface
    for the protocol server to interact with the daemon.
    """

    def __init__(self, daemon: 'EvolutionDaemonV8'):
        """
        Initialize the bridge with a daemon instance

        Args:
            daemon: EvolutionDaemonV8 instance to forward genomes to
        """
        self.daemon = daemon
        logger.info("🔗 EvolutionDaemonBridge initialized")

    def forward_genome(self, genome_data: dict) -> bool:
        """
        Forward genome data to the daemon's queue

        Args:
            genome_data: Dict with genome information:
                - id: str - Genome identifier
                - data: bytes - Binary payload
                - generation: int - Generation number
                - fitness: float - Fitness score
                - metadata: dict - Additional metadata

        Returns:
            bool: True if successfully queued, False otherwise
        """
        try:
            # Convert bytes data if it's in list format (from JSON)
            if isinstance(genome_data.get('data'), list):
                genome_data['data'] = bytes(genome_data['data'])

            self.daemon.queue_genome(genome_data)
            logger.info(f"✅ Genome forwarded to daemon: {genome_data.get('id')}")
            return True
        except Exception as e:
            logger.error(f"❌ Failed to forward genome: {e}")
            return False

    def get_daemon_status(self) -> dict:
        """
        Get current status of the daemon

        Returns:
            dict with keys:
                - queue_size: int
                - running: bool
        """
        return {
            'queue_size': self.daemon.get_queue_size(),
            'running': getattr(self.daemon, 'running', False)
        }
