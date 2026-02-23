"""
Evolution Daemon - Behavioral Defense Integration Tests

End-to-end integration tests for the behavioral defense system.

Tests the complete flow:
1. WordPressSentinel scans telemetry files
2. BehavioralMonitor records and analyzes events
3. TierRouter performs tier demotion when anomalies detected
4. PrognosticsEngine graceful fallback when unavailable

Uses real telemetry files from wordpress_zone/telemetry/
"""

import json
import os
import tempfile
from pathlib import Path
from unittest.mock import patch, MagicMock

import pytest

from systems.evolution_daemon.safety import (
    AgentBehavioralProfile,
    BehavioralEvent,
    BehavioralMonitor,
    WordPressSentinel,
    TierRouter,
    EvolutionProposal,
    GuardianVerdict,
)


class TestFullBehavioralDefenseFlow:
    """Integration tests for the full behavioral defense flow."""

    @pytest.fixture
    def real_telemetry_path(self):
        """Get the real telemetry path for integration tests."""
        return Path("wordpress_zone/telemetry")

    @pytest.fixture
    def temp_telemetry_dir(self):
        """Create a temporary telemetry directory with test data."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield Path(tmpdir)

    @pytest.fixture
    def behavioral_monitor(self):
        """Create a BehavioralMonitor with low threshold for testing."""
        return BehavioralMonitor(anomaly_threshold=0.7, sliding_window_seconds=300)

    @pytest.fixture
    def tier_router(self, behavioral_monitor):
        """Create a TierRouter with behavioral monitor attached."""
        return TierRouter(behavioral_monitor=behavioral_monitor)

    @pytest.fixture
    def test_proposal(self):
        """Create a minor proposal for testing."""
        return EvolutionProposal(
            proposal_id="test-prop-001",
            goal="Test behavioral defense",
            target_files=["test.py"],
            diff_content="# test change\n",
            lines_changed=1
        )

    @pytest.fixture
    def low_risk_verdict(self):
        """Create a low risk verdict."""
        return GuardianVerdict(
            approved=True,
            proposal_id="test-prop-001",
            risk_level="low"
        )

    def test_full_flow_sentinel_to_tier_demotion(
        self, temp_telemetry_dir, behavioral_monitor, tier_router,
        test_proposal, low_risk_verdict
    ):
        """
        Test complete flow: Sentinel scans -> Monitor detects -> Tier demotion.

        This is the core E2E test for behavioral defense:
        1. Create telemetry files with suspicious activity patterns
        2. Sentinel scans and extracts events
        3. Monitor records events and updates profiles
        4. TierRouter elevates tier based on behavioral analysis
        """
        agent_id = "wordpress_suspicious_agent"

        # Create a telemetry file with suspicious file access patterns
        telemetry_file = temp_telemetry_dir / "suspicious_activity.jsonl"
        with open(telemetry_file, 'w') as f:
            # Simulate suspicious file access pattern
            for i in range(25):
                event = {
                    "type": "file_read",
                    "source": agent_id,
                    "timestamp": 1700000000 + i,
                    "data": {
                        "path": f"/etc/sensitive_file_{i}",
                        "user": "www-data"
                    }
                }
                f.write(json.dumps(event) + '\n')

        # Step 1: Sentinel scans telemetry
        sentinel = WordPressSentinel(telemetry_path=str(temp_telemetry_dir))
        events = sentinel.scan_telemetry(incremental=False)

        # Verify events were extracted
        assert len(events) == 25
        assert all(isinstance(e, BehavioralEvent) for e in events)

        # Step 2: BehavioralMonitor records events
        for event in events:
            # Convert BehavioralEvent to record_event format
            behavioral_monitor.record_event(
                agent_id=event.agent_id,
                event_type=event.event_type,
                metadata=event.metadata
            )

        # Verify profile was created with activity
        profile = behavioral_monitor.get_profile(agent_id)
        assert profile.file_ops_count == 25  # All file_read events

        # Step 3: Make the agent anomalous by setting high entropy
        # (In real scenario, high entropy would come from actual suspicious patterns)
        profile.entropy_score = 0.8  # Above threshold

        # Step 4: TierRouter performs tier demotion
        code_tier = tier_router.classify(test_proposal, low_risk_verdict)
        behavior_tier = tier_router.classify_with_behavior(
            test_proposal, low_risk_verdict, agent_id
        )

        # Code tier should be 1 (minor change), but behavior elevates to 3
        assert code_tier == 1
        assert behavior_tier == 3, "Anomalous agent should be elevated to tier 3"

    def test_flow_with_normal_agent_no_elevation(
        self, temp_telemetry_dir, behavioral_monitor, tier_router,
        test_proposal, low_risk_verdict
    ):
        """
        Test that normal agent behavior does not cause tier elevation.
        """
        agent_id = "wordpress_normal_agent"

        # Create telemetry with normal activity
        telemetry_file = temp_telemetry_dir / "normal_activity.jsonl"
        with open(telemetry_file, 'w') as f:
            for i in range(5):
                event = {
                    "type": "file_read",
                    "source": agent_id,
                    "timestamp": 1700000000 + i,
                    "data": {
                        "path": f"/var/www/html/post_{i}.php",
                        "user": "www-data"
                    }
                }
                f.write(json.dumps(event) + '\n')

        # Scan and record
        sentinel = WordPressSentinel(telemetry_path=str(temp_telemetry_dir))
        events = sentinel.scan_telemetry(incremental=False)

        for event in events:
            behavioral_monitor.record_event(
                agent_id=event.agent_id,
                event_type=event.event_type,
                metadata=event.metadata
            )

        # Get profile - should have low entropy
        profile = behavioral_monitor.get_profile(agent_id)
        assert profile.file_ops_count == 5

        # Tier classification should not be elevated
        code_tier = tier_router.classify(test_proposal, low_risk_verdict)
        behavior_tier = tier_router.classify_with_behavior(
            test_proposal, low_risk_verdict, agent_id
        )

        assert code_tier == 1
        assert behavior_tier == 1, "Normal agent should not be elevated"

    def test_incremental_scanning_with_new_suspicious_activity(
        self, temp_telemetry_dir, behavioral_monitor, tier_router,
        test_proposal, low_risk_verdict
    ):
        """
        Test incremental scanning: normal first, then suspicious activity added.
        """
        agent_id = "wordpress_agent_becoming_suspicious"
        telemetry_file = temp_telemetry_dir / "growing_activity.jsonl"

        # Initial normal activity
        with open(telemetry_file, 'w') as f:
            for i in range(3):
                event = {
                    "type": "file_read",
                    "source": agent_id,
                    "timestamp": 1700000000 + i,
                    "data": {"path": f"/normal/path_{i}"}
                }
                f.write(json.dumps(event) + '\n')

        sentinel = WordPressSentinel(telemetry_path=str(temp_telemetry_dir))

        # First scan - normal activity
        events1 = sentinel.scan_telemetry(incremental=True)
        assert len(events1) == 3

        for event in events1:
            behavioral_monitor.record_event(
                agent_id=event.agent_id,
                event_type=event.event_type,
                metadata=event.metadata
            )

        # Check tier - should be normal
        tier1 = tier_router.classify_with_behavior(
            test_proposal, low_risk_verdict, agent_id
        )
        assert tier1 == 1

        # Add suspicious activity
        with open(telemetry_file, 'a') as f:
            for i in range(20):
                event = {
                    "type": "file_read",
                    "source": agent_id,
                    "timestamp": 1700000100 + i,
                    "data": {"path": f"/etc/shadow_{i}"}
                }
                f.write(json.dumps(event) + '\n')

        # Second incremental scan
        events2 = sentinel.scan_telemetry(incremental=True)
        assert len(events2) == 20, "Incremental scan should only get new events"

        for event in events2:
            behavioral_monitor.record_event(
                agent_id=event.agent_id,
                event_type=event.event_type,
                metadata=event.metadata
            )

        # Profile should show increased activity
        profile = behavioral_monitor.get_profile(agent_id)
        assert profile.file_ops_count == 23  # 3 + 20

        # Make anomalous for test
        profile.entropy_score = 0.8

        # Tier should now be elevated
        tier2 = tier_router.classify_with_behavior(
            test_proposal, low_risk_verdict, agent_id
        )
        assert tier2 == 3, "Agent should be elevated after suspicious activity"


class TestRealTelemetryFiles:
    """Tests using real telemetry files from wordpress_zone/telemetry/."""

    @pytest.fixture
    def real_telemetry_path(self):
        """Get the real telemetry path."""
        return Path("wordpress_zone/telemetry")

    def test_scan_real_telemetry_files(self, real_telemetry_path):
        """
        Test scanning real telemetry files from wordpress_zone/telemetry/.

        This validates the integration works with actual data files.
        """
        if not real_telemetry_path.exists():
            pytest.skip(f"Real telemetry path does not exist: {real_telemetry_path}")

        sentinel = WordPressSentinel(telemetry_path=str(real_telemetry_path))
        events = sentinel.scan_telemetry(incremental=False)

        # Should extract events from real files
        assert isinstance(events, list)

        # If there are events, validate their structure
        for event in events:
            assert isinstance(event, BehavioralEvent)
            assert event.event_id is not None
            assert event.agent_id is not None
            assert event.event_type is not None
            assert event.timestamp is not None
            assert 0.0 <= event.entropy <= 1.0

    def test_monitor_processes_real_events(self, real_telemetry_path):
        """
        Test that BehavioralMonitor can process events from real telemetry.
        """
        if not real_telemetry_path.exists():
            pytest.skip(f"Real telemetry path does not exist: {real_telemetry_path}")

        sentinel = WordPressSentinel(telemetry_path=str(real_telemetry_path))
        events = sentinel.scan_telemetry(incremental=False)

        if len(events) == 0:
            pytest.skip("No events in real telemetry files")

        monitor = BehavioralMonitor(anomaly_threshold=0.7)

        # Process all events
        for event in events:
            monitor.record_event(
                agent_id=event.agent_id,
                event_type=event.event_type,
                metadata=event.metadata
            )

        # Verify profiles were created
        # Get unique agent IDs
        agent_ids = set(e.agent_id for e in events)
        assert len(agent_ids) > 0

        for agent_id in agent_ids:
            profile = monitor.get_profile(agent_id)
            assert isinstance(profile, AgentBehavioralProfile)
            assert profile.agent_id == agent_id

    def test_full_integration_with_real_data(self, real_telemetry_path):
        """
        Full E2E integration test with real telemetry data.

        Validates the complete behavioral defense pipeline works with
        actual WordPress telemetry files.
        """
        if not real_telemetry_path.exists():
            pytest.skip(f"Real telemetry path does not exist: {real_telemetry_path}")

        # Setup components
        monitor = BehavioralMonitor(anomaly_threshold=0.7)
        router = TierRouter(behavioral_monitor=monitor)
        sentinel = WordPressSentinel(telemetry_path=str(real_telemetry_path))

        # Create test proposal and verdict
        proposal = EvolutionProposal(
            proposal_id="real-integration-test",
            goal="Test with real telemetry",
            target_files=["test.py"],
            diff_content="# test",
            lines_changed=1
        )
        verdict = GuardianVerdict(
            approved=True,
            proposal_id="real-integration-test",
            risk_level="low"
        )

        # Scan and process events
        events = sentinel.scan_telemetry(incremental=False)

        if len(events) == 0:
            pytest.skip("No events in real telemetry files")

        for event in events:
            monitor.record_event(
                agent_id=event.agent_id,
                event_type=event.event_type,
                metadata=event.metadata
            )

        # Test tier classification for each agent found
        agent_ids = set(e.agent_id for e in events)

        for agent_id in agent_ids:
            profile = monitor.get_profile(agent_id)

            # Get both code-only and behavior-aware tiers
            code_tier = router.classify(proposal, verdict)
            behavior_tier = router.classify_with_behavior(proposal, verdict, agent_id)

            # Behavior tier should be >= code tier (never lowers)
            assert behavior_tier >= code_tier, (
                f"Behavior tier ({behavior_tier}) should never be less than "
                f"code tier ({code_tier})"
            )


class TestPrognosticsEngineGracefulFallback:
    """Tests for PrognosticsEngine optional dependency with graceful fallback."""

    def test_prognostics_import_failure_graceful(self):
        """
        Test that missing PrognosticsEngine is handled gracefully.
        """
        # Try importing prognostics_engine
        try:
            from systems.evolution_daemon.safety.prognostics_engine import (
                PrognosticsEngine
            )
            prognostics_available = True
        except ImportError:
            prognostics_available = False

        # BehavioralMonitor should work without PrognosticsEngine
        monitor = BehavioralMonitor()
        assert monitor is not None

        # Should be able to record events without PrognosticsEngine
        event = monitor.record_event("test-agent", "file_read", {"path": "/test"})
        assert event is not None

        # Should be able to detect anomalies without PrognosticsEngine
        profile = monitor.get_profile("test-agent")
        assert profile is not None

        # Note: In a full implementation, BehavioralMonitor could optionally
        # integrate with PrognosticsEngine for predictive anomaly detection.
        # For now, it works standalone.

    def test_behavioral_monitor_works_standalone(self):
        """
        Test that BehavioralMonitor works as a standalone component.
        """
        monitor = BehavioralMonitor(anomaly_threshold=0.7)

        # Record various event types
        events = [
            ("agent-1", "file_read", {"path": "/etc/passwd"}),
            ("agent-1", "file_write", {"path": "/tmp/data"}),
            ("agent-1", "network_request", {"endpoint": "/api/v1/data"}),
            ("agent-2", "file_read", {"path": "/var/log/syslog"}),
        ]

        for agent_id, event_type, metadata in events:
            monitor.record_event(agent_id, event_type, metadata)

        # Verify profiles exist
        profile1 = monitor.get_profile("agent-1")
        assert profile1.file_ops_count == 2
        assert profile1.network_ops_count == 1

        profile2 = monitor.get_profile("agent-2")
        assert profile2.file_ops_count == 1

        # Test anomaly detection
        assert not monitor.is_anomalous("agent-1")
        assert not monitor.is_anomalous("agent-2")

    def test_tier_router_without_prognostics(self):
        """
        Test TierRouter behavioral integration works without PrognosticsEngine.
        """
        monitor = BehavioralMonitor(anomaly_threshold=0.7)
        router = TierRouter(behavioral_monitor=monitor)

        proposal = EvolutionProposal(
            proposal_id="test",
            goal="Test",
            target_files=["test.py"],
            diff_content="# test",
            lines_changed=1
        )
        verdict = GuardianVerdict(approved=True, proposal_id="test", risk_level="low")

        # Record events and make agent anomalous
        monitor.record_event("suspicious", "file_read", {"path": "/etc/shadow"})
        profile = monitor.get_profile("suspicious")
        profile.entropy_score = 0.8

        # Tier should be elevated based on behavioral analysis alone
        tier = router.classify_with_behavior(proposal, verdict, "suspicious")
        assert tier == 3


class TestMultipleAgentsScenario:
    """Tests for scenarios with multiple agents."""

    @pytest.fixture
    def temp_telemetry_dir(self):
        """Create a temporary telemetry directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield Path(tmpdir)

    def test_multiple_agents_different_behaviors(
        self, temp_telemetry_dir
    ):
        """
        Test handling multiple agents with different behavior patterns.
        """
        # Create telemetry with multiple agents
        telemetry_file = temp_telemetry_dir / "multi_agent.jsonl"

        agents = {
            "normal_agent": {"count": 5, "entropy": 0.3},
            "suspicious_agent": {"count": 30, "entropy": 0.8},
            "borderline_agent": {"count": 15, "entropy": 0.6},
        }

        with open(telemetry_file, 'w') as f:
            for agent_id, config in agents.items():
                for i in range(config["count"]):
                    event = {
                        "type": "file_read",
                        "source": agent_id,
                        "timestamp": 1700000000 + i,
                        "data": {"path": f"/path/{i}"}
                    }
                    f.write(json.dumps(event) + '\n')

        # Scan and process
        sentinel = WordPressSentinel(telemetry_path=str(temp_telemetry_dir))
        events = sentinel.scan_telemetry(incremental=False)

        monitor = BehavioralMonitor(anomaly_threshold=0.7)
        router = TierRouter(behavioral_monitor=monitor)

        for event in events:
            monitor.record_event(
                agent_id=event.agent_id,
                event_type=event.event_type,
                metadata=event.metadata
            )

        # Set entropy scores for testing
        for agent_id, config in agents.items():
            profile = monitor.get_profile(agent_id)
            profile.entropy_score = config["entropy"]

        # Create test proposal
        proposal = EvolutionProposal(
            proposal_id="multi-test",
            goal="Test",
            target_files=["test.py"],
            diff_content="# test",
            lines_changed=1
        )
        verdict = GuardianVerdict(approved=True, proposal_id="multi-test", risk_level="low")

        # Check tiers for each agent
        normal_tier = router.classify_with_behavior(proposal, verdict, "normal_agent")
        suspicious_tier = router.classify_with_behavior(proposal, verdict, "suspicious_agent")
        borderline_tier = router.classify_with_behavior(proposal, verdict, "borderline_agent")

        # Expected: normal=1, suspicious=3, borderline=2
        assert normal_tier == 1, "Normal agent should have tier 1"
        assert suspicious_tier == 3, "Suspicious agent should have tier 3"
        assert borderline_tier == 2, "Borderline agent should have tier 2"


class TestEdgeCasesAndErrorHandling:
    """Tests for edge cases and error handling in integration."""

    @pytest.fixture
    def temp_telemetry_dir(self):
        """Create a temporary telemetry directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield Path(tmpdir)

    def test_empty_telemetry_directory(self, temp_telemetry_dir):
        """Test handling of empty telemetry directory."""
        sentinel = WordPressSentinel(telemetry_path=str(temp_telemetry_dir))
        events = sentinel.scan_telemetry()

        assert events == []

        # Monitor should handle no events gracefully
        monitor = BehavioralMonitor()
        # No events to record - should not crash

        # Getting unknown profile creates new one
        profile = monitor.get_profile("unknown")
        assert profile.agent_id == "unknown"
        assert profile.file_ops_count == 0

    def test_malformed_telemetry_doesnt_break_flow(self, temp_telemetry_dir):
        """Test that malformed telemetry files don't break the flow."""
        # Create valid and invalid files
        valid_file = temp_telemetry_dir / "valid.jsonl"
        invalid_file = temp_telemetry_dir / "invalid.jsonl"

        with open(valid_file, 'w') as f:
            f.write('{"type": "file_read", "source": "agent1", "timestamp": 1700000000}\n')

        with open(invalid_file, 'w') as f:
            f.write('{"type": "file_read", "source":\n')  # Malformed

        sentinel = WordPressSentinel(telemetry_path=str(temp_telemetry_dir))
        events = sentinel.scan_telemetry(incremental=False)

        # Should get the valid event, skip the malformed
        assert len(events) == 1
        assert events[0].agent_id == "agent1"

    def test_tier_router_resilience_with_missing_monitor(self):
        """Test TierRouter works correctly when behavioral_monitor is None."""
        router = TierRouter(behavioral_monitor=None)

        proposal = EvolutionProposal(
            proposal_id="no-monitor-test",
            goal="Test",
            target_files=["test.py"],
            diff_content="# test",
            lines_changed=1
        )
        verdict = GuardianVerdict(approved=True, proposal_id="no-monitor-test", risk_level="low")

        # Should work without monitor - returns code tier only
        tier = router.classify_with_behavior(proposal, verdict, "any-agent")
        assert tier == 1  # Code tier for minor change

    def test_concurrent_agent_access(self, temp_telemetry_dir):
        """Test handling of concurrent access from multiple agents."""
        monitor = BehavioralMonitor()
        router = TierRouter(behavioral_monitor=monitor)

        # Simulate concurrent events from multiple agents
        for i in range(50):
            agent_id = f"agent-{i % 5}"  # 5 agents
            event_type = "file_read" if i % 2 == 0 else "network_request"
            monitor.record_event(agent_id, event_type, {"data": i})

        # All agents should have profiles
        for i in range(5):
            agent_id = f"agent-{i}"
            profile = monitor.get_profile(agent_id)
            assert profile is not None
            assert profile.file_ops_count + profile.network_ops_count > 0


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
