"""
Test EvolutionDaemonBridge for connecting protocol server to daemon
"""
import pytest
import json
import sys
from pathlib import Path

# Add root to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

def test_bridge_forward_genome_to_daemon():
    """Bridge should forward genomes to EvolutionDaemonV8"""
    from systems.neural_cortex.evolution_daemon_bridge import EvolutionDaemonBridge
    from evolution_daemon_v8 import EvolutionDaemonV8

    daemon = EvolutionDaemonV8()
    bridge = EvolutionDaemonBridge(daemon)

    test_genome = {
        'id': 'bridge-test-1',
        'data': bytes([0xCA, 0xFE]),
        'generation': 1,
        'fitness': 0.99
    }

    bridge.forward_genome(test_genome)
    assert daemon.get_queue_size() == 1, "Daemon should have 1 genome in queue"
