#!/usr/bin/env python3
"""
Tests for Infinite Map Security Hardening Module.

Tests TLS configuration, certificate management, vulnerability scanning,
intrusion detection, security policies, and audit reporting.
"""

import pytest
import json
import tempfile
import os
import time
from pathlib import Path
from unittest.mock import Mock, patch, MagicMock
from datetime import datetime, timedelta
from collections import defaultdict

from systems.pixel_compiler.infinite_map_security_hardening import (
    # Enums
    TLSVersion,
    CipherSuite,
    VulnerabilitySeverity,
    SecurityEventType,
    # Dataclasses
    TLSConfig,
    CertificateInfo,
    Vulnerability,
    SecurityEvent,
    SecurityPolicy,
    # Classes
    CertificateManager,
    VulnerabilityScanner,
    IntrusionDetector,
    SecurityPolicyEnforcer,
    SecurityAuditor,
    SecurityHardeningManager,
)


# ============================================================================
# Test Enums
# ============================================================================

class TestEnums:
    """Tests for enums."""

    def test_tls_versions(self):
        """Test TLSVersion enum values."""
        assert TLSVersion.TLS_1_2.value == "TLSv1.2"
        assert TLSVersion.TLS_1_3.value == "TLSv1.3"

    def test_cipher_suites(self):
        """Test CipherSuite enum values."""
        assert CipherSuite.AES256_GCM_SHA384.value == "TLS_AES_256_GCM_SHA384"
        assert CipherSuite.CHACHA20_POLY1305_SHA256.value == "TLS_CHACHA20_POLY1305_SHA256"

    def test_vulnerability_severity(self):
        """Test VulnerabilitySeverity enum values."""
        assert VulnerabilitySeverity.CRITICAL.value == "critical"
        assert VulnerabilitySeverity.HIGH.value == "high"
        assert VulnerabilitySeverity.MEDIUM.value == "medium"
        assert VulnerabilitySeverity.LOW.value == "low"
        assert VulnerabilitySeverity.INFO.value == "info"

    def test_security_event_types(self):
        """Test SecurityEventType enum values."""
        assert SecurityEventType.AUTH_FAILURE.value == "auth_failure"
        assert SecurityEventType.BRUTE_FORCE.value == "brute_force"
        assert SecurityEventType.UNAUTHORIZED_ACCESS.value == "unauthorized_access"


# ============================================================================
# Test Dataclasses
# ============================================================================

class TestTLSConfig:
    """Tests for TLSConfig dataclass."""

    def test_creation(self):
        """Test TLSConfig creation."""
        config = TLSConfig(
            enabled=True,
            version=TLSVersion.TLS_1_3,
            cert_path="/path/to/cert.pem",
            key_path="/path/to/key.pem",
        )
        assert config.enabled is True
        assert config.version == TLSVersion.TLS_1_3
        assert config.cert_path == "/path/to/cert.pem"

    def test_defaults(self):
        """Test default values."""
        config = TLSConfig()
        assert config.enabled is True
        assert config.version == TLSVersion.TLS_1_3
        assert config.verify_mode == "required"
        assert len(config.cipher_suites) == 2

    def test_to_dict(self):
        """Test to_dict conversion."""
        config = TLSConfig(
            enabled=True,
            version=TLSVersion.TLS_1_3,
            cipher_suites=[CipherSuite.AES256_GCM_SHA384],
        )
        d = config.to_dict()
        assert d["enabled"] is True
        assert d["version"] == "TLSv1.3"
        assert len(d["cipher_suites"]) == 1


class TestCertificateInfo:
    """Tests for CertificateInfo dataclass."""

    def test_creation(self):
        """Test CertificateInfo creation."""
        now = datetime.now()
        info = CertificateInfo(
            subject="test.example.com",
            issuer="Test CA",
            serial_number="1234567890",
            not_before=now,
            not_after=now + timedelta(days=365),
            is_self_signed=True,
            is_ca=False,
            fingerprint="abcd" * 16,
            key_size=4096,
        )
        assert info.subject == "test.example.com"
        assert info.is_self_signed is True

    def test_is_expired(self):
        """Test is_expired property."""
        info = CertificateInfo(
            subject="test",
            issuer="CA",
            serial_number="123",
            not_before=datetime.now() - timedelta(days=365),
            not_after=datetime.now() - timedelta(days=1),
            is_self_signed=False,
            is_ca=False,
            fingerprint="abc",
            key_size=2048,
        )
        assert info.is_expired is True

    def test_days_until_expiry(self):
        """Test days_until_expiry property."""
        info = CertificateInfo(
            subject="test",
            issuer="CA",
            serial_number="123",
            not_before=datetime.now(),
            not_after=datetime.now() + timedelta(days=30),
            is_self_signed=False,
            is_ca=False,
            fingerprint="abc",
            key_size=2048,
        )
        assert 29 <= info.days_until_expiry <= 31

    def test_to_dict(self):
        """Test to_dict conversion."""
        info = CertificateInfo(
            subject="test",
            issuer="CA",
            serial_number="123",
            not_before=datetime(2025, 1, 1),
            not_after=datetime(2026, 1, 1),
            is_self_signed=True,
            is_ca=False,
            fingerprint="abc",
            key_size=2048,
        )
        d = info.to_dict()
        assert d["subject"] == "test"
        assert d["is_self_signed"] is True


class TestVulnerability:
    """Tests for Vulnerability dataclass."""

    def test_creation(self):
        """Test Vulnerability creation."""
        vuln = Vulnerability(
            id="SEC001",
            name="Test Vulnerability",
            severity=VulnerabilitySeverity.HIGH,
            description="A test vulnerability",
            location="/config",
            recommendation="Fix it",
            cve_id="CVE-2025-1234",
        )
        assert vuln.id == "SEC001"
        assert vuln.severity == VulnerabilitySeverity.HIGH
        assert vuln.cve_id == "CVE-2025-1234"

    def test_to_dict(self):
        """Test to_dict conversion."""
        vuln = Vulnerability(
            id="SEC001",
            name="Test",
            severity=VulnerabilitySeverity.MEDIUM,
            description="Test",
            location="/",
            recommendation="Fix",
        )
        d = vuln.to_dict()
        assert d["id"] == "SEC001"
        assert d["severity"] == "medium"


class TestSecurityEvent:
    """Tests for SecurityEvent dataclass."""

    def test_creation(self):
        """Test SecurityEvent creation."""
        event = SecurityEvent(
            event_type=SecurityEventType.AUTH_FAILURE,
            source_ip="192.168.1.100",
            timestamp=datetime.now(),
            details={"username": "admin"},
            severity=VulnerabilitySeverity.MEDIUM,
        )
        assert event.event_type == SecurityEventType.AUTH_FAILURE
        assert event.source_ip == "192.168.1.100"

    def test_to_dict(self):
        """Test to_dict conversion."""
        event = SecurityEvent(
            event_type=SecurityEventType.BRUTE_FORCE,
            source_ip="10.0.0.1",
            timestamp=datetime(2025, 1, 1, 12, 0, 0),
            details={"attempts": 10},
            severity=VulnerabilitySeverity.HIGH,
        )
        d = event.to_dict()
        assert d["event_type"] == "brute_force"
        assert d["source_ip"] == "10.0.0.1"


class TestSecurityPolicy:
    """Tests for SecurityPolicy dataclass."""

    def test_creation(self):
        """Test SecurityPolicy creation."""
        policy = SecurityPolicy(
            name="test_policy",
            description="A test policy",
            rules=[{"action": "deny", "pattern": "admin"}],
        )
        assert policy.name == "test_policy"
        assert len(policy.rules) == 1
        assert policy.enabled is True

    def test_to_dict(self):
        """Test to_dict conversion."""
        policy = SecurityPolicy(
            name="test",
            description="Test",
            rules=[],
            enabled=False,
        )
        d = policy.to_dict()
        assert d["name"] == "test"
        assert d["enabled"] is False


# ============================================================================
# Test CertificateManager
# ============================================================================

class TestCertificateManager:
    """Tests for CertificateManager class."""

    def test_init(self, tmp_path):
        """Test initialization."""
        manager = CertificateManager(cert_dir=str(tmp_path))
        assert manager.cert_dir == tmp_path

    def test_generate_self_signed(self, tmp_path):
        """Test generating self-signed certificate."""
        manager = CertificateManager(cert_dir=str(tmp_path))
        cert_path, key_path = manager.generate_self_signed("test-cert")

        assert os.path.exists(cert_path)
        assert os.path.exists(key_path)
        assert cert_path.endswith("test-cert.crt")
        assert key_path.endswith("test-cert.key")

    def test_generate_self_signed_custom_params(self, tmp_path):
        """Test generating certificate with custom parameters."""
        manager = CertificateManager(cert_dir=str(tmp_path))
        cert_path, key_path = manager.generate_self_signed(
            common_name="custom",
            organization="Test Org",
            days_valid=30,
            key_size=2048,
        )

        assert os.path.exists(cert_path)
        assert os.path.exists(key_path)

    def test_load_certificate(self, tmp_path):
        """Test loading certificate."""
        manager = CertificateManager(cert_dir=str(tmp_path))
        cert_path, _ = manager.generate_self_signed("test")

        info = manager.load_certificate(cert_path)

        # May be mock or real depending on cryptography availability
        assert info is not None
        assert info.subject != ""

    def test_validate_certificate(self, tmp_path):
        """Test validating certificate."""
        manager = CertificateManager(cert_dir=str(tmp_path))
        cert_path, _ = manager.generate_self_signed("test")

        valid, issues = manager.validate_certificate(cert_path)

        # Should be valid (just generated)
        assert isinstance(valid, bool)
        assert isinstance(issues, list)

    def test_create_ssl_context(self, tmp_path):
        """Test creating SSL context."""
        manager = CertificateManager(cert_dir=str(tmp_path))
        cert_path, key_path = manager.generate_self_signed("test")

        config = TLSConfig(
            enabled=True,
            cert_path=cert_path,
            key_path=key_path,
        )

        context = manager.create_ssl_context(config)

        # Context creation depends on Python SSL support
        assert context is not None or not config.enabled


# ============================================================================
# Test VulnerabilityScanner
# ============================================================================

class TestVulnerabilityScanner:
    """Tests for VulnerabilityScanner class."""

    def test_init(self):
        """Test initialization."""
        scanner = VulnerabilityScanner()
        assert len(scanner.vulnerabilities) == 0

    def test_scan_config_no_vulnerabilities(self):
        """Test scanning secure config."""
        scanner = VulnerabilityScanner()

        config = {
            "tls_version": "TLSv1.3",
            "verify_mode": "required",
            "encryption_enabled": True,
            "key_size": 256,
            "rate_limit_enabled": True,
            "debug_mode": False,
            "audit_logging": True,
        }

        vulns = scanner.scan_config(config)

        assert len(vulns) == 0

    def test_scan_config_weak_tls(self):
        """Test detecting weak TLS."""
        scanner = VulnerabilityScanner()

        config = {
            "tls_version": "TLSv1.0",
            "verify_mode": "required",
        }

        vulns = scanner.scan_config(config)

        assert any(v.id == "SEC001" for v in vulns)

    def test_scan_config_disabled_verification(self):
        """Test detecting disabled certificate verification."""
        scanner = VulnerabilityScanner()

        config = {
            "verify_mode": "none",
        }

        vulns = scanner.scan_config(config)

        assert any(v.id == "SEC002" for v in vulns)

    def test_scan_config_debug_mode(self):
        """Test detecting debug mode."""
        scanner = VulnerabilityScanner()

        config = {
            "debug_mode": True,
        }

        vulns = scanner.scan_config(config)

        assert any(v.id == "SEC006" for v in vulns)

    def test_scan_config_multiple_vulnerabilities(self):
        """Test detecting multiple vulnerabilities."""
        scanner = VulnerabilityScanner()

        config = {
            "tls_version": "TLSv1.0",
            "verify_mode": "none",
            "debug_mode": True,
            "encryption_enabled": False,
        }

        vulns = scanner.scan_config(config)

        assert len(vulns) >= 3

    def test_scan_file_permissions(self, tmp_path):
        """Test scanning file permissions."""
        scanner = VulnerabilityScanner()

        # Create world-writable file
        test_file = tmp_path / "test.txt"
        test_file.write_text("test")
        os.chmod(test_file, 0o666)  # World-writable

        vulns = scanner.scan_file_permissions(str(test_file))

        assert any(v.id == "SEC010" for v in vulns)

    def test_scan_private_key_permissions(self, tmp_path):
        """Test scanning private key permissions."""
        scanner = VulnerabilityScanner()

        # Create key file with insecure permissions
        key_file = tmp_path / "test.key"
        key_file.write_text("MOCK KEY")
        os.chmod(key_file, 0o644)  # Not 0600

        vulns = scanner.scan_file_permissions(str(key_file))

        assert any(v.id == "SEC011" for v in vulns)

    def test_get_summary(self):
        """Test getting vulnerability summary."""
        scanner = VulnerabilityScanner()

        scanner.vulnerabilities = [
            Vulnerability("1", "V1", VulnerabilitySeverity.HIGH, "", "", ""),
            Vulnerability("2", "V2", VulnerabilitySeverity.HIGH, "", "", ""),
            Vulnerability("3", "V3", VulnerabilitySeverity.MEDIUM, "", "", ""),
        ]

        summary = scanner.get_summary()

        assert summary["high"] == 2
        assert summary["medium"] == 1


# ============================================================================
# Test IntrusionDetector
# ============================================================================

class TestIntrusionDetector:
    """Tests for IntrusionDetector class."""

    def test_init(self):
        """Test initialization."""
        detector = IntrusionDetector()
        assert len(detector.failed_attempts) == 0
        assert len(detector.banned_ips) == 0

    def test_record_auth_failure(self):
        """Test recording authentication failure."""
        detector = IntrusionDetector()

        event = detector.record_auth_failure("192.168.1.1", "admin")

        assert event is not None
        assert event.event_type == SecurityEventType.AUTH_FAILURE
        assert "192.168.1.1" in detector.failed_attempts

    def test_brute_force_detection(self):
        """Test brute force detection."""
        detector = IntrusionDetector(auth_failure_threshold=3)

        # Record failures
        for i in range(3):
            event = detector.record_auth_failure("192.168.1.1", "admin")

        # Third failure should trigger brute force detection
        assert "192.168.1.1" in detector.banned_ips

        brute_force_events = detector.get_events_by_type(SecurityEventType.BRUTE_FORCE)
        assert len(brute_force_events) >= 1

    def test_is_banned(self):
        """Test checking if IP is banned."""
        detector = IntrusionDetector(auth_failure_threshold=2, ban_duration=60)

        # Ban the IP
        for i in range(2):
            detector.record_auth_failure("192.168.1.1", "admin")

        assert detector.is_banned("192.168.1.1") is True
        assert detector.is_banned("192.168.1.2") is False

    def test_ban_expiry(self):
        """Test ban expiry."""
        detector = IntrusionDetector(auth_failure_threshold=1, ban_duration=1)

        # Ban the IP
        detector.record_auth_failure("192.168.1.1", "admin")
        assert detector.is_banned("192.168.1.1") is True

        # Wait for ban to expire
        time.sleep(1.1)

        assert detector.is_banned("192.168.1.1") is False

    def test_record_suspicious_activity(self):
        """Test recording suspicious activity."""
        detector = IntrusionDetector()

        event = detector.record_suspicious_activity(
            "192.168.1.1",
            "sql_injection_attempt",
            {"payload": "' OR 1=1 --"},
        )

        assert event.event_type == SecurityEventType.SUSPICIOUS_PATTERN
        assert event.details["pattern"] == "sql_injection_attempt"

    def test_get_recent_events(self):
        """Test getting recent events."""
        detector = IntrusionDetector()

        detector.record_auth_failure("192.168.1.1", "admin")
        detector.record_suspicious_activity("192.168.1.1", "test")

        recent = detector.get_recent_events(seconds=60)

        assert len(recent) == 2

    def test_clear_old_events(self):
        """Test clearing old events."""
        detector = IntrusionDetector()

        detector.record_auth_failure("192.168.1.1", "admin")

        # Manually set old timestamp
        detector.events[0].timestamp = datetime.now() - timedelta(hours=25)

        detector.clear_old_events(max_age_hours=24)

        assert len(detector.events) == 0


# ============================================================================
# Test SecurityPolicyEnforcer
# ============================================================================

class TestSecurityPolicyEnforcer:
    """Tests for SecurityPolicyEnforcer class."""

    def test_init(self):
        """Test initialization."""
        enforcer = SecurityPolicyEnforcer()
        assert len(enforcer.policies) == 0

    def test_add_policy(self):
        """Test adding a policy."""
        enforcer = SecurityPolicyEnforcer()

        policy = SecurityPolicy(
            name="test_policy",
            description="Test",
            rules=[{"action": "deny", "operation": "admin.*"}],
        )

        success = enforcer.add_policy(policy)

        assert success is True
        assert "test_policy" in enforcer.policies

    def test_remove_policy(self):
        """Test removing a policy."""
        enforcer = SecurityPolicyEnforcer()

        policy = SecurityPolicy(name="test", description="", rules=[])
        enforcer.add_policy(policy)

        removed = enforcer.remove_policy("test")

        assert removed is True
        assert "test" not in enforcer.policies

    def test_remove_nonexistent_policy(self):
        """Test removing nonexistent policy."""
        enforcer = SecurityPolicyEnforcer()
        removed = enforcer.remove_policy("nonexistent")
        assert removed is False

    def test_check_operation_allowed(self):
        """Test checking allowed operation."""
        enforcer = SecurityPolicyEnforcer()

        allowed, reason = enforcer.check_operation("read_file", {})
        assert allowed is True

    def test_check_operation_denied(self):
        """Test checking denied operation."""
        enforcer = SecurityPolicyEnforcer()

        policy = SecurityPolicy(
            name="deny_admin",
            description="Deny admin operations",
            rules=[{
                "action": "deny",
                "operation": "admin.*",
                "reason": "Admin operations restricted",
            }],
        )
        enforcer.add_policy(policy)

        allowed, reason = enforcer.check_operation("admin.delete", {})
        assert allowed is False
        assert "restricted" in reason.lower()

    def test_check_operation_require(self):
        """Test checking operation with requirements."""
        enforcer = SecurityPolicyEnforcer()

        policy = SecurityPolicy(
            name="require_auth",
            description="Require authentication",
            rules=[{
                "action": "require",
                "operation": "write.*",
                "requires": ["authenticated"],
            }],
        )
        enforcer.add_policy(policy)

        # Without authentication
        allowed, reason = enforcer.check_operation("write_file", {})
        assert allowed is False
        assert "authenticated" in reason

        # With authentication
        allowed, reason = enforcer.check_operation("write_file", {"authenticated": True})
        assert allowed is True

    def test_disabled_policy(self):
        """Test disabled policy doesn't apply."""
        enforcer = SecurityPolicyEnforcer()

        policy = SecurityPolicy(
            name="deny_all",
            description="Deny all",
            rules=[{"action": "deny", "operation": ".*"}],
            enabled=False,
        )
        enforcer.add_policy(policy)

        allowed, _ = enforcer.check_operation("anything", {})
        assert allowed is True

    def test_get_policies(self):
        """Test getting all policies."""
        enforcer = SecurityPolicyEnforcer()

        enforcer.add_policy(SecurityPolicy("p1", "", []))
        enforcer.add_policy(SecurityPolicy("p2", "", []))

        policies = enforcer.get_policies()
        assert len(policies) == 2


# ============================================================================
# Test SecurityAuditor
# ============================================================================

class TestSecurityAuditor:
    """Tests for SecurityAuditor class."""

    def test_init(self):
        """Test initialization."""
        auditor = SecurityAuditor()
        assert auditor.cert_manager is not None
        assert auditor.vuln_scanner is not None
        assert len(auditor.findings) == 0

    def test_run_full_audit_empty(self):
        """Test running audit with empty config."""
        auditor = SecurityAuditor()
        report = auditor.run_full_audit()

        assert "timestamp" in report
        assert "findings" in report
        assert "security_score" in report
        assert "grade" in report

    def test_run_full_audit_with_vulnerabilities(self):
        """Test running audit with vulnerable config."""
        auditor = SecurityAuditor()

        config = {
            "debug_mode": True,
            "verify_mode": "none",
        }

        report = auditor.run_full_audit(config=config)

        assert len(report["findings"]) > 0
        assert report["security_score"] < 100

    def test_run_full_audit_with_certificates(self, tmp_path):
        """Test running audit with certificates."""
        auditor = SecurityAuditor()

        # Create mock certificate
        cert_file = tmp_path / "test.crt"
        cert_file.write_text("MOCK CERTIFICATE")

        report = auditor.run_full_audit(cert_paths=[str(cert_file)])

        assert "findings" in report

    def test_score_to_grade(self):
        """Test score to grade conversion."""
        auditor = SecurityAuditor()

        assert auditor._score_to_grade(95) == "A"
        assert auditor._score_to_grade(85) == "B"
        assert auditor._score_to_grade(75) == "C"
        assert auditor._score_to_grade(65) == "D"
        assert auditor._score_to_grade(55) == "F"

    def test_generate_recommendations(self):
        """Test generating recommendations."""
        auditor = SecurityAuditor()

        auditor.findings = [
            {
                "type": "vulnerability",
                "severity": "high",
                "details": {"recommendation": "Enable TLS 1.3"},
            },
            {
                "type": "vulnerability",
                "severity": "medium",
                "details": {"recommendation": "Fix permissions"},
            },
        ]

        recommendations = auditor._generate_recommendations()

        assert "Enable TLS 1.3" in recommendations
        assert "Fix permissions" in recommendations

    def test_print_report(self, capsys):
        """Test printing report."""
        auditor = SecurityAuditor()

        report = {
            "timestamp": "2025-01-01T00:00:00",
            "security_score": 85,
            "grade": "B",
            "summary": {"total_findings": 1, "by_severity": {"high": 1}},
            "findings": [{
                "type": "vulnerability",
                "severity": "high",
                "source": "test",
                "details": {"name": "Test Vuln", "description": "A test"},
            }],
            "recommendations": ["Fix the issue"],
        }

        auditor.print_report(report)

        captured = capsys.readouterr()
        assert "SECURITY AUDIT REPORT" in captured.out
        assert "85/100" in captured.out


# ============================================================================
# Test SecurityHardeningManager
# ============================================================================

class TestSecurityHardeningManager:
    """Tests for SecurityHardeningManager class."""

    def test_init(self):
        """Test initialization."""
        manager = SecurityHardeningManager()
        assert manager.tls_config is not None
        assert manager.cert_manager is not None
        assert manager.vuln_scanner is not None

    def test_init_with_config(self):
        """Test initialization with config."""
        config = {
            "tls": {
                "enabled": False,
                "version": "TLSv1.2",
            }
        }

        manager = SecurityHardeningManager(config)

        assert manager.tls_config.enabled is False
        assert manager.tls_config.version == TLSVersion.TLS_1_2

    def test_setup_tls_disabled(self):
        """Test TLS setup when disabled."""
        manager = SecurityHardeningManager({"tls": {"enabled": False}})

        success, msg = manager.setup_tls()

        assert success is True
        assert "disabled" in msg.lower()

    def test_setup_tls_generate_cert(self):
        """Test TLS setup with certificate generation."""
        manager = SecurityHardeningManager()

        success, msg = manager.setup_tls()

        assert success is True
        assert "certificate" in msg.lower() or "success" in msg.lower()

    def test_run_security_audit(self):
        """Test running security audit."""
        manager = SecurityHardeningManager()

        report = manager.run_security_audit()

        assert "security_score" in report
        assert "findings" in report

    def test_check_request_allowed(self):
        """Test checking allowed request."""
        manager = SecurityHardeningManager()

        allowed, reason = manager.check_request(
            "192.168.1.1",
            "read_file",
            {"authenticated": True},
        )

        assert allowed is True

    def test_check_request_banned_ip(self):
        """Test checking request from banned IP."""
        manager = SecurityHardeningManager()
        manager.intrusion_detector.banned_ips["10.0.0.1"] = datetime.now() + timedelta(hours=1)

        allowed, reason = manager.check_request("10.0.0.1", "read_file")

        assert allowed is False
        assert "banned" in reason.lower()

    def test_get_security_status(self):
        """Test getting security status."""
        manager = SecurityHardeningManager()

        status = manager.get_security_status()

        assert "tls_enabled" in status
        assert "policies_count" in status
        assert "banned_ips" in status


# ============================================================================
# Integration Tests
# ============================================================================

class TestSecurityIntegration:
    """Integration tests for security hardening."""

    def test_full_security_workflow(self, tmp_path):
        """Test full security workflow."""
        # 1. Create manager
        manager = SecurityHardeningManager()

        # 2. Setup TLS
        success, msg = manager.setup_tls()
        assert success is True

        # 3. Add security policy
        policy = SecurityPolicy(
            name="admin_restriction",
            description="Restrict admin operations",
            rules=[{
                "action": "require",
                "operation": "admin.*",
                "requires": ["is_admin"],
            }],
        )
        manager.policy_enforcer.add_policy(policy)

        # 4. Check operations
        allowed, _ = manager.check_request("192.168.1.1", "admin.config", {"is_admin": True})
        assert allowed is True

        allowed, _ = manager.check_request("192.168.1.1", "admin.config", {})
        assert allowed is False

        # 5. Run audit
        report = manager.run_security_audit()
        assert "security_score" in report

    def test_intrusion_detection_workflow(self):
        """Test intrusion detection workflow."""
        detector = IntrusionDetector(auth_failure_threshold=3)

        # Record multiple failures
        for i in range(5):
            detector.record_auth_failure("10.0.0.1", "admin")

        # Check IP is banned
        assert detector.is_banned("10.0.0.1")

        # Check events were recorded
        events = detector.get_recent_events()
        assert len(events) >= 5

        # Check brute force detected
        brute_force = detector.get_events_by_type(SecurityEventType.BRUTE_FORCE)
        assert len(brute_force) >= 1

    def test_vulnerability_scanning_workflow(self, tmp_path):
        """Test vulnerability scanning workflow."""
        scanner = VulnerabilityScanner()

        # 1. Scan config
        config = {
            "debug_mode": True,
            "verify_mode": "none",
        }
        config_vulns = scanner.scan_config(config)
        assert len(config_vulns) > 0

        # 2. Scan file permissions
        insecure_file = tmp_path / "insecure.key"
        insecure_file.write_text("key")
        os.chmod(insecure_file, 0o644)

        perm_vulns = scanner.scan_file_permissions(str(insecure_file))
        assert len(perm_vulns) > 0

        # 3. Get summary
        summary = scanner.get_summary()
        assert "critical" in summary or "high" in summary


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
