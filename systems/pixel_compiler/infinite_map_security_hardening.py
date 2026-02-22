#!/usr/bin/env python3
"""
Infinite Map Security Hardening Module.

Provides production-grade security for enterprise deployment:
- TLS/SSL support for distributed mode
- Certificate management
- Vulnerability scanning
- Security policy enforcement
- Intrusion detection
- Security audit reporting

Usage:
    from infinite_map_security_hardening import (
        TLSConfig,
        CertificateManager,
        VulnerabilityScanner,
        SecurityPolicy,
        IntrusionDetector,
        SecurityAuditor,
    )
"""

import os
import sys
import json
import ssl
import socket
import hashlib
import secrets
import tempfile
import ipaddress
import subprocess
from pathlib import Path
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any, Callable, Tuple, Set
from datetime import datetime, timedelta
from enum import Enum, auto
from collections import defaultdict
import logging
import re

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Try to import cryptography for certificate handling
try:
    from cryptography import x509
    from cryptography.x509.oid import NameOID
    from cryptography.hazmat.primitives import hashes, serialization
    from cryptography.hazmat.primitives.asymmetric import rsa
    from cryptography.hazmat.backends import default_backend
    HAS_CRYPTOGRAPHY = True
except ImportError:
    HAS_CRYPTOGRAPHY = False


# ============================================================================
# Enums
# ============================================================================

class TLSVersion(Enum):
    """TLS protocol versions."""
    TLS_1_2 = "TLSv1.2"
    TLS_1_3 = "TLSv1.3"


class CipherSuite(Enum):
    """Supported cipher suites."""
    ECDHE_RSA_AES256_GCM_SHA384 = "ECDHE-RSA-AES256-GCM-SHA384"
    ECDHE_RSA_CHACHA20_POLY1305 = "ECDHE-RSA-CHACHA20-POLY1305"
    AES256_GCM_SHA384 = "TLS_AES_256_GCM_SHA384"
    CHACHA20_POLY1305_SHA256 = "TLS_CHACHA20_POLY1305_SHA256"


class VulnerabilitySeverity(Enum):
    """Vulnerability severity levels."""
    CRITICAL = "critical"
    HIGH = "high"
    MEDIUM = "medium"
    LOW = "low"
    INFO = "info"


class SecurityEventType(Enum):
    """Security event types for intrusion detection."""
    AUTH_FAILURE = "auth_failure"
    BRUTE_FORCE = "brute_force"
    UNAUTHORIZED_ACCESS = "unauthorized_access"
    SUSPICIOUS_PATTERN = "suspicious_pattern"
    RATE_LIMIT_EXCEEDED = "rate_limit_exceeded"
    CERTIFICATE_INVALID = "certificate_invalid"
    ENCRYPTION_FAILURE = "encryption_failure"


# ============================================================================
# Dataclasses
# ============================================================================

@dataclass
class TLSConfig:
    """TLS configuration."""
    enabled: bool = True
    version: TLSVersion = TLSVersion.TLS_1_3
    cert_path: str = ""
    key_path: str = ""
    ca_path: str = ""
    verify_mode: str = "required"  # none, optional, required
    cipher_suites: List[CipherSuite] = field(default_factory=lambda: [
        CipherSuite.AES256_GCM_SHA384,
        CipherSuite.CHACHA20_POLY1305_SHA256,
    ])

    def to_dict(self) -> Dict[str, Any]:
        return {
            "enabled": self.enabled,
            "version": self.version.value,
            "cert_path": self.cert_path,
            "key_path": self.key_path,
            "ca_path": self.ca_path,
            "verify_mode": self.verify_mode,
            "cipher_suites": [c.value for c in self.cipher_suites],
        }


@dataclass
class CertificateInfo:
    """Certificate information."""
    subject: str
    issuer: str
    serial_number: str
    not_before: datetime
    not_after: datetime
    is_self_signed: bool
    is_ca: bool
    fingerprint: str
    key_size: int

    def to_dict(self) -> Dict[str, Any]:
        return {
            "subject": self.subject,
            "issuer": self.issuer,
            "serial_number": self.serial_number,
            "not_before": self.not_before.isoformat(),
            "not_after": self.not_after.isoformat(),
            "is_self_signed": self.is_self_signed,
            "is_ca": self.is_ca,
            "fingerprint": self.fingerprint,
            "key_size": self.key_size,
        }

    @property
    def is_expired(self) -> bool:
        return datetime.now() > self.not_after

    @property
    def days_until_expiry(self) -> int:
        return (self.not_after - datetime.now()).days


@dataclass
class Vulnerability:
    """Detected vulnerability."""
    id: str
    name: str
    severity: VulnerabilitySeverity
    description: str
    location: str
    recommendation: str
    cve_id: Optional[str] = None

    def to_dict(self) -> Dict[str, Any]:
        return {
            "id": self.id,
            "name": self.name,
            "severity": self.severity.value,
            "description": self.description,
            "location": self.location,
            "recommendation": self.recommendation,
            "cve_id": self.cve_id,
        }


@dataclass
class SecurityEvent:
    """Security event for intrusion detection."""
    event_type: SecurityEventType
    source_ip: str
    timestamp: datetime
    details: Dict[str, Any]
    severity: VulnerabilitySeverity

    def to_dict(self) -> Dict[str, Any]:
        return {
            "event_type": self.event_type.value,
            "source_ip": self.source_ip,
            "timestamp": self.timestamp.isoformat(),
            "details": self.details,
            "severity": self.severity.value,
        }


@dataclass
class SecurityPolicy:
    """Security policy configuration."""
    name: str
    description: str
    rules: List[Dict[str, Any]]
    enabled: bool = True
    created_at: datetime = field(default_factory=datetime.now)

    def to_dict(self) -> Dict[str, Any]:
        return {
            "name": self.name,
            "description": self.description,
            "rules": self.rules,
            "enabled": self.enabled,
            "created_at": self.created_at.isoformat(),
        }


# ============================================================================
# Certificate Manager
# ============================================================================

class CertificateManager:
    """
    Manages TLS certificates.

    Supports self-signed certificate generation, certificate inspection,
    and certificate validation.
    """

    def __init__(self, cert_dir: Optional[str] = None):
        if cert_dir:
            self.cert_dir = Path(cert_dir)
        else:
            self.cert_dir = Path(tempfile.gettempdir()) / "infinite_map_certs"
        self.cert_dir.mkdir(parents=True, exist_ok=True)

    def generate_self_signed(
        self,
        common_name: str = "infinite-map",
        organization: str = "Infinite Map",
        days_valid: int = 365,
        key_size: int = 4096
    ) -> Tuple[str, str]:
        """
        Generate a self-signed certificate.

        Returns:
            (cert_path, key_path)
        """
        if not HAS_CRYPTOGRAPHY:
            logger.warning("cryptography not installed, using mock certificates")
            return self._generate_mock_cert(common_name)

        # Generate private key
        private_key = rsa.generate_private_key(
            public_exponent=65537,
            key_size=key_size,
            backend=default_backend(),
        )

        # Create certificate subject
        subject = issuer = x509.Name([
            x509.NameAttribute(NameOID.COUNTRY_NAME, "US"),
            x509.NameAttribute(NameOID.STATE_OR_PROVINCE_NAME, "California"),
            x509.NameAttribute(NameOID.LOCALITY_NAME, "San Francisco"),
            x509.NameAttribute(NameOID.ORGANIZATION_NAME, organization),
            x509.NameAttribute(NameOID.COMMON_NAME, common_name),
        ])

        # Build certificate
        cert = (
            x509.CertificateBuilder()
            .subject_name(subject)
            .issuer_name(issuer)
            .public_key(private_key.public_key())
            .serial_number(x509.random_serial_number())
            .not_valid_before(datetime.utcnow())
            .not_valid_after(datetime.utcnow() + timedelta(days=days_valid))
            .add_extension(
                x509.SubjectAlternativeName([
                    x509.DNSName("localhost"),
                    x509.DNSName("*.local"),
                    x509.IPAddress(ipaddress.IPv4Address("127.0.0.1")),
                ]),
                critical=False,
            )
            .sign(private_key, hashes.SHA256(), default_backend())
        )

        # Save certificate
        cert_path = self.cert_dir / f"{common_name}.crt"
        key_path = self.cert_dir / f"{common_name}.key"

        with open(cert_path, "wb") as f:
            f.write(cert.public_bytes(serialization.Encoding.PEM))

        with open(key_path, "wb") as f:
            f.write(private_key.private_bytes(
                encoding=serialization.Encoding.PEM,
                format=serialization.PrivateFormat.PKCS8,
                encryption_algorithm=serialization.NoEncryption(),
            ))

        # Set restrictive permissions on key
        os.chmod(key_path, 0o600)

        logger.info(f"Generated self-signed certificate: {cert_path}")
        return str(cert_path), str(key_path)

    def _generate_mock_cert(self, common_name: str) -> Tuple[str, str]:
        """Generate mock certificate files for testing."""
        cert_path = self.cert_dir / f"{common_name}.crt"
        key_path = self.cert_dir / f"{common_name}.key"

        cert_path.write_text(f"MOCK CERTIFICATE FOR {common_name}\n")
        key_path.write_text(f"MOCK PRIVATE KEY FOR {common_name}\n")

        return str(cert_path), str(key_path)

    def load_certificate(self, cert_path: str) -> Optional[CertificateInfo]:
        """Load and parse a certificate."""
        if not HAS_CRYPTOGRAPHY:
            return self._mock_cert_info(cert_path)

        try:
            with open(cert_path, "rb") as f:
                cert = x509.load_pem_x509_certificate(f.read(), default_backend())

            subject = cert.subject.get_attributes_for_oid(NameOID.COMMON_NAME)[0].value
            issuer = cert.issuer.get_attributes_for_oid(NameOID.COMMON_NAME)[0].value

            # Handle both old and new cryptography API
            try:
                not_before = cert.not_valid_before_utc.replace(tzinfo=None)
                not_after = cert.not_valid_after_utc.replace(tzinfo=None)
            except AttributeError:
                # Fall back to deprecated API for older cryptography versions
                not_before = cert.not_valid_before
                not_after = cert.not_valid_after

            return CertificateInfo(
                subject=subject,
                issuer=issuer,
                serial_number=format(cert.serial_number, 'x'),
                not_before=not_before,
                not_after=not_after,
                is_self_signed=subject == issuer,
                is_ca=self._is_ca(cert),
                fingerprint=cert.fingerprint(hashes.SHA256()).hex(),
                key_size=cert.public_key().key_size if hasattr(cert.public_key(), 'key_size') else 0,
            )
        except Exception as e:
            logger.error(f"Failed to load certificate: {e}")
            return None

    def _mock_cert_info(self, cert_path: str) -> CertificateInfo:
        """Return mock certificate info for testing."""
        return CertificateInfo(
            subject=os.path.basename(cert_path),
            issuer="Mock CA",
            serial_number="1234567890",
            not_before=datetime.now(),
            not_after=datetime.now() + timedelta(days=365),
            is_self_signed=True,
            is_ca=False,
            fingerprint="abcd" * 16,
            key_size=4096,
        )

    def _is_ca(self, cert) -> bool:
        """Check if certificate is a CA."""
        try:
            basic_constraints = cert.extensions.get_extension_for_oid(
                x509.oid.ExtensionOID.BASIC_CONSTRAINTS
            )
            return basic_constraints.value.ca
        except Exception:
            return False

    def validate_certificate(self, cert_path: str) -> Tuple[bool, List[str]]:
        """Validate a certificate."""
        issues = []

        info = self.load_certificate(cert_path)
        if info is None:
            return False, ["Failed to load certificate"]

        if info.is_expired:
            issues.append(f"Certificate expired on {info.not_after}")

        if info.days_until_expiry < 30:
            issues.append(f"Certificate expires in {info.days_until_expiry} days")

        if info.key_size < 2048:
            issues.append(f"Key size {info.key_size} is too small (minimum 2048)")

        return len(issues) == 0, issues

    def create_ssl_context(
        self,
        config: TLSConfig
    ) -> Optional[ssl.SSLContext]:
        """Create an SSL context from configuration."""
        if not config.enabled:
            return None

        # Determine protocol version
        if config.version == TLSVersion.TLS_1_3:
            protocol = ssl.PROTOCOL_TLS_CLIENT
        else:
            protocol = ssl.PROTOCOL_TLS_CLIENT

        context = ssl.SSLContext(protocol)

        # Set minimum version
        if config.version == TLSVersion.TLS_1_3:
            context.minimum_version = ssl.TLSVersion.TLSv1_3
        else:
            context.minimum_version = ssl.TLSVersion.TLSv1_2

        # Load certificate and key
        if config.cert_path and os.path.exists(config.cert_path):
            context.load_cert_chain(config.cert_path, config.key_path)

        # Load CA certificates
        if config.ca_path and os.path.exists(config.ca_path):
            context.load_verify_locations(config.ca_path)

        # Set verify mode
        if config.verify_mode == "required":
            context.verify_mode = ssl.CERT_REQUIRED
        elif config.verify_mode == "optional":
            context.verify_mode = ssl.CERT_OPTIONAL
        else:
            context.verify_mode = ssl.CERT_NONE

        # Set cipher suites
        if config.cipher_suites:
            try:
                cipher_list = ":".join(c.value for c in config.cipher_suites)
                context.set_ciphers(cipher_list)
            except ssl.SSLError as e:
                logger.warning(f"Could not set custom cipher suites: {e}")
                # Fall back to default ciphers
                pass

        return context


# ============================================================================
# Vulnerability Scanner
# ============================================================================

class VulnerabilityScanner:
    """
    Scans for security vulnerabilities.

    Checks for common security issues in configuration and code.
    """

    # Known vulnerability patterns
    VULNERABILITY_CHECKS = [
        {
            "id": "SEC001",
            "name": "Weak TLS Version",
            "description": "TLS version older than 1.2 is enabled",
            "severity": VulnerabilitySeverity.HIGH,
            "check": lambda config: config.get("tls_version") in ["TLSv1.0", "TLSv1.1"],
            "location": "tls_config",
            "recommendation": "Enable TLS 1.2 or higher",
        },
        {
            "id": "SEC002",
            "name": "Certificate Verification Disabled",
            "description": "TLS certificate verification is disabled",
            "severity": VulnerabilitySeverity.CRITICAL,
            "check": lambda config: config.get("verify_mode") == "none",
            "location": "tls_config",
            "recommendation": "Enable certificate verification",
        },
        {
            "id": "SEC003",
            "name": "Encryption Disabled",
            "description": "Data encryption is disabled",
            "severity": VulnerabilitySeverity.CRITICAL,
            "check": lambda config: not config.get("encryption_enabled", True),
            "location": "encryption_config",
            "recommendation": "Enable AES-256 encryption",
        },
        {
            "id": "SEC004",
            "name": "Weak Key Size",
            "description": "Encryption key size is too small",
            "severity": VulnerabilitySeverity.HIGH,
            "check": lambda config: config.get("key_size", 256) < 256,
            "location": "encryption_config",
            "recommendation": "Use at least 256-bit keys",
        },
        {
            "id": "SEC005",
            "name": "No Rate Limiting",
            "description": "Rate limiting is not configured",
            "severity": VulnerabilitySeverity.MEDIUM,
            "check": lambda config: not config.get("rate_limit_enabled", False),
            "location": "rate_limit_config",
            "recommendation": "Configure rate limiting",
        },
        {
            "id": "SEC006",
            "name": "Debug Mode Enabled",
            "description": "Debug mode is enabled in production",
            "severity": VulnerabilitySeverity.HIGH,
            "check": lambda config: config.get("debug_mode", False),
            "location": "general_config",
            "recommendation": "Disable debug mode in production",
        },
        {
            "id": "SEC007",
            "name": "Default Credentials",
            "description": "Default credentials are in use",
            "severity": VulnerabilitySeverity.CRITICAL,
            "check": lambda config: config.get("use_default_credentials", False),
            "location": "auth_config",
            "recommendation": "Change default credentials",
        },
        {
            "id": "SEC008",
            "name": "Audit Logging Disabled",
            "description": "Audit logging is not enabled",
            "severity": VulnerabilitySeverity.MEDIUM,
            "check": lambda config: not config.get("audit_logging", True),
            "location": "logging_config",
            "recommendation": "Enable audit logging",
        },
    ]

    def __init__(self):
        self.vulnerabilities: List[Vulnerability] = []

    def scan_config(self, config: Dict[str, Any]) -> List[Vulnerability]:
        """Scan configuration for vulnerabilities."""
        self.vulnerabilities = []

        for check in self.VULNERABILITY_CHECKS:
            try:
                if check["check"](config):
                    self.vulnerabilities.append(Vulnerability(
                        id=check["id"],
                        name=check["name"],
                        severity=check["severity"],
                        description=check["description"],
                        location=check["location"],
                        recommendation=check["recommendation"],
                    ))
            except Exception as e:
                logger.debug(f"Check {check['id']} failed: {e}")

        return self.vulnerabilities

    def scan_file_permissions(self, path: str) -> List[Vulnerability]:
        """Scan file permissions for security issues."""
        vulnerabilities = []

        p = Path(path)
        if not p.exists():
            return vulnerabilities

        # Check for world-writable files
        mode = p.stat().st_mode
        if mode & 0o002:  # World writable
            vulnerabilities.append(Vulnerability(
                id="SEC010",
                name="World-Writable File",
                severity=VulnerabilitySeverity.HIGH,
                description=f"File {path} is world-writable",
                location=path,
                recommendation="Remove world-write permission",
            ))

        # Check for private key with bad permissions
        if path.endswith(".key") and mode & 0o077:  # Not 0600
            vulnerabilities.append(Vulnerability(
                id="SEC011",
                name="Insecure Private Key Permissions",
                severity=VulnerabilitySeverity.CRITICAL,
                description=f"Private key {path} has insecure permissions",
                location=path,
                recommendation="Set permissions to 0600 for private keys",
            ))

        return vulnerabilities

    def scan_dependencies(self) -> List[Vulnerability]:
        """Scan dependencies for known vulnerabilities."""
        vulnerabilities = []

        try:
            # Try running pip-audit or safety
            result = subprocess.run(
                ["pip-audit", "--format", "json"],
                capture_output=True,
                text=True,
                timeout=60,
            )

            if result.returncode == 0:
                for vuln in json.loads(result.stdout):
                    vulnerabilities.append(Vulnerability(
                        id=f"PIP-{vuln.get('id', 'unknown')}",
                        name=vuln.get("name", "Unknown"),
                        severity=self._map_pip_severity(vuln.get("severity", "")),
                        description=vuln.get("description", ""),
                        location=f"{vuln.get('name')} {vuln.get('version')}",
                        recommendation="Upgrade to patched version",
                        cve_id=vuln.get("cve_id"),
                    ))
        except (subprocess.TimeoutExpired, FileNotFoundError, json.JSONDecodeError):
            logger.debug("pip-audit not available or failed")

        return vulnerabilities

    def _map_pip_severity(self, severity: str) -> VulnerabilitySeverity:
        """Map pip-audit severity to our severity levels."""
        severity = severity.lower()
        if severity in ["critical", "high"]:
            return VulnerabilitySeverity.HIGH
        elif severity == "medium":
            return VulnerabilitySeverity.MEDIUM
        elif severity == "low":
            return VulnerabilitySeverity.LOW
        return VulnerabilitySeverity.INFO

    def get_summary(self) -> Dict[str, int]:
        """Get vulnerability summary by severity."""
        summary = defaultdict(int)
        for vuln in self.vulnerabilities:
            summary[vuln.severity.value] += 1
        return dict(summary)


# ============================================================================
# Intrusion Detector
# ============================================================================

class IntrusionDetector:
    """
    Detects potential security intrusions.

    Monitors for suspicious patterns and brute force attacks.
    """

    def __init__(
        self,
        auth_failure_threshold: int = 5,
        auth_failure_window: int = 300,  # 5 minutes
        ban_duration: int = 3600  # 1 hour
    ):
        self.auth_failure_threshold = auth_failure_threshold
        self.auth_failure_window = auth_failure_window
        self.ban_duration = ban_duration

        self.failed_attempts: Dict[str, List[datetime]] = defaultdict(list)
        self.banned_ips: Dict[str, datetime] = {}
        self.events: List[SecurityEvent] = []
        self._lock = threading.Lock() if hasattr(threading, 'Lock') else None

    def record_auth_failure(
        self,
        source_ip: str,
        username: str = "",
        details: Optional[Dict[str, Any]] = None
    ) -> Optional[SecurityEvent]:
        """Record an authentication failure."""
        now = datetime.now()

        if self._lock:
            with self._lock:
                self.failed_attempts[source_ip].append(now)
                # Clean old attempts
                cutoff = now - timedelta(seconds=self.auth_failure_window)
                self.failed_attempts[source_ip] = [
                    t for t in self.failed_attempts[source_ip]
                    if t > cutoff
                ]

                failure_count = len(self.failed_attempts[source_ip])
        else:
            failure_count = 1

        event = SecurityEvent(
            event_type=SecurityEventType.AUTH_FAILURE,
            source_ip=source_ip,
            timestamp=now,
            details={
                "username": username,
                "failure_count": failure_count,
                **(details or {}),
            },
            severity=VulnerabilitySeverity.LOW,
        )

        self.events.append(event)

        # Check for brute force
        if failure_count >= self.auth_failure_threshold:
            self.banned_ips[source_ip] = now + timedelta(seconds=self.ban_duration)

            brute_event = SecurityEvent(
                event_type=SecurityEventType.BRUTE_FORCE,
                source_ip=source_ip,
                timestamp=now,
                details={
                    "failure_count": failure_count,
                    "ban_duration": self.ban_duration,
                },
                severity=VulnerabilitySeverity.HIGH,
            )
            self.events.append(brute_event)
            return brute_event

        return event

    def is_banned(self, source_ip: str) -> bool:
        """Check if an IP is banned."""
        if source_ip in self.banned_ips:
            if datetime.now() < self.banned_ips[source_ip]:
                return True
            else:
                # Ban expired
                del self.banned_ips[source_ip]
        return False

    def record_suspicious_activity(
        self,
        source_ip: str,
        pattern: str,
        details: Optional[Dict[str, Any]] = None
    ) -> SecurityEvent:
        """Record suspicious activity."""
        event = SecurityEvent(
            event_type=SecurityEventType.SUSPICIOUS_PATTERN,
            source_ip=source_ip,
            timestamp=datetime.now(),
            details={
                "pattern": pattern,
                **(details or {}),
            },
            severity=VulnerabilitySeverity.MEDIUM,
        )

        self.events.append(event)
        return event

    def get_recent_events(
        self,
        seconds: int = 3600
    ) -> List[SecurityEvent]:
        """Get recent security events."""
        cutoff = datetime.now() - timedelta(seconds=seconds)
        return [e for e in self.events if e.timestamp >= cutoff]

    def get_events_by_type(
        self,
        event_type: SecurityEventType
    ) -> List[SecurityEvent]:
        """Get events by type."""
        return [e for e in self.events if e.event_type == event_type]

    def clear_old_events(self, max_age_hours: int = 24):
        """Clear old events."""
        cutoff = datetime.now() - timedelta(hours=max_age_hours)
        self.events = [e for e in self.events if e.timestamp >= cutoff]


# ============================================================================
# Security Policy Enforcer
# ============================================================================

class SecurityPolicyEnforcer:
    """
    Enforces security policies.

    Validates operations against defined policies.
    """

    def __init__(self):
        self.policies: Dict[str, SecurityPolicy] = {}
        self._lock = threading.Lock() if hasattr(threading, 'Lock') else None

    def add_policy(self, policy: SecurityPolicy) -> bool:
        """Add a security policy."""
        if self._lock:
            with self._lock:
                self.policies[policy.name] = policy
        else:
            self.policies[policy.name] = policy
        return True

    def remove_policy(self, name: str) -> bool:
        """Remove a security policy."""
        if self._lock:
            with self._lock:
                if name in self.policies:
                    del self.policies[name]
                    return True
        else:
            if name in self.policies:
                del self.policies[name]
                return True
        return False

    def check_operation(
        self,
        operation: str,
        context: Dict[str, Any]
    ) -> Tuple[bool, str]:
        """
        Check if an operation is allowed.

        Returns:
            (allowed, reason)
        """
        for name, policy in self.policies.items():
            if not policy.enabled:
                continue

            for rule in policy.rules:
                if self._matches_rule(operation, context, rule):
                    action = rule.get("action", "allow")

                    if action == "deny":
                        return False, f"Denied by policy '{name}': {rule.get('reason', '')}"

                    if action == "require":
                        required = rule.get("requires", [])
                        for req in required:
                            if not context.get(req):
                                return False, f"Missing required: {req}"

        return True, "Allowed"

    def _matches_rule(
        self,
        operation: str,
        context: Dict[str, Any],
        rule: Dict[str, Any]
    ) -> bool:
        """Check if an operation matches a rule."""
        # Check operation pattern
        pattern = rule.get("operation")
        if pattern:
            if not re.match(pattern, operation):
                return False

        # Check context conditions
        conditions = rule.get("conditions", {})
        for key, value in conditions.items():
            if context.get(key) != value:
                return False

        return True

    def get_policies(self) -> List[SecurityPolicy]:
        """Get all policies."""
        return list(self.policies.values())


# ============================================================================
# Security Auditor
# ============================================================================

class SecurityAuditor:
    """
    Generates security audit reports.

    Provides comprehensive security assessment and reporting.
    """

    def __init__(self):
        self.cert_manager = CertificateManager()
        self.vuln_scanner = VulnerabilityScanner()
        self.findings: List[Dict[str, Any]] = []

    def run_full_audit(
        self,
        config: Optional[Dict[str, Any]] = None,
        cert_paths: Optional[List[str]] = None
    ) -> Dict[str, Any]:
        """Run a full security audit."""
        self.findings = []

        # 1. Configuration vulnerability scan
        if config:
            vulns = self.vuln_scanner.scan_config(config)
            for v in vulns:
                self.findings.append({
                    "type": "vulnerability",
                    "source": "config_scan",
                    "severity": v.severity.value,
                    "details": v.to_dict(),
                })

        # 2. Certificate validation
        if cert_paths:
            for cert_path in cert_paths:
                if os.path.exists(cert_path):
                    valid, issues = self.cert_manager.validate_certificate(cert_path)
                    if not valid:
                        self.findings.append({
                            "type": "certificate_issue",
                            "source": cert_path,
                            "severity": "high",
                            "details": {"issues": issues},
                        })

                    # File permission scan
                    perm_vulns = self.vuln_scanner.scan_file_permissions(cert_path)
                    for v in perm_vulns:
                        self.findings.append({
                            "type": "vulnerability",
                            "source": "permission_scan",
                            "severity": v.severity.value,
                            "details": v.to_dict(),
                        })

        # 3. Dependency scan (optional)
        try:
            dep_vulns = self.vuln_scanner.scan_dependencies()
            for v in dep_vulns:
                self.findings.append({
                    "type": "dependency_vulnerability",
                    "source": "dependency_scan",
                    "severity": v.severity.value,
                    "details": v.to_dict(),
                })
        except Exception as e:
            logger.debug(f"Dependency scan failed: {e}")

        return self._generate_report()

    def _generate_report(self) -> Dict[str, Any]:
        """Generate audit report."""
        by_severity = defaultdict(int)
        for finding in self.findings:
            by_severity[finding["severity"]] += 1

        # Calculate security score (0-100)
        critical = by_severity.get("critical", 0)
        high = by_severity.get("high", 0)
        medium = by_severity.get("medium", 0)
        low = by_severity.get("low", 0)

        # Deduct points for each severity
        score = 100
        score -= critical * 25
        score -= high * 10
        score -= medium * 5
        score -= low * 2
        score = max(0, min(100, score))

        return {
            "timestamp": datetime.now().isoformat(),
            "findings": self.findings,
            "summary": {
                "total_findings": len(self.findings),
                "by_severity": dict(by_severity),
            },
            "security_score": score,
            "grade": self._score_to_grade(score),
            "recommendations": self._generate_recommendations(),
        }

    def _score_to_grade(self, score: int) -> str:
        """Convert score to letter grade."""
        if score >= 90:
            return "A"
        elif score >= 80:
            return "B"
        elif score >= 70:
            return "C"
        elif score >= 60:
            return "D"
        else:
            return "F"

    def _generate_recommendations(self) -> List[str]:
        """Generate recommendations based on findings."""
        recommendations = []

        for finding in self.findings:
            if finding["type"] == "vulnerability":
                rec = finding["details"].get("recommendation")
                if rec and rec not in recommendations:
                    recommendations.append(rec)

        return recommendations

    def print_report(self, report: Optional[Dict[str, Any]] = None):
        """Print audit report to console."""
        report = report or self._generate_report()

        print("\n" + "=" * 70)
        print("SECURITY AUDIT REPORT")
        print("=" * 70)

        print(f"\nTimestamp: {report['timestamp']}")
        print(f"Security Score: {report['security_score']}/100 (Grade: {report['grade']})")

        print(f"\n{'='*70}")
        print("SUMMARY")
        print("-" * 40)
        print(f"Total Findings: {report['summary']['total_findings']}")
        for severity, count in report['summary']['by_severity'].items():
            print(f"  {severity.upper()}: {count}")

        if report['findings']:
            print(f"\n{'='*70}")
            print("FINDINGS")
            print("-" * 40)

            for i, finding in enumerate(report['findings'], 1):
                print(f"\n{i}. [{finding['severity'].upper()}] {finding['type']}")
                print(f"   Source: {finding['source']}")
                if 'details' in finding:
                    details = finding['details']
                    if 'name' in details:
                        print(f"   Name: {details['name']}")
                    if 'description' in details:
                        print(f"   Description: {details['description']}")
                    if 'recommendation' in details:
                        print(f"   Recommendation: {details['recommendation']}")

        if report['recommendations']:
            print(f"\n{'='*70}")
            print("RECOMMENDATIONS")
            print("-" * 40)
            for i, rec in enumerate(report['recommendations'], 1):
                print(f"{i}. {rec}")

        print("=" * 70)


# ============================================================================
# Unified Security Manager
# ============================================================================

class SecurityHardeningManager:
    """
    Unified security hardening manager.

    Provides a single interface for all security features.
    """

    def __init__(self, config: Optional[Dict[str, Any]] = None):
        self.config = config or {}

        self.tls_config = self._parse_tls_config()
        self.cert_manager = CertificateManager()
        self.vuln_scanner = VulnerabilityScanner()
        self.intrusion_detector = IntrusionDetector()
        self.policy_enforcer = SecurityPolicyEnforcer()
        self.auditor = SecurityAuditor()

    def _parse_tls_config(self) -> TLSConfig:
        """Parse TLS configuration."""
        tls_cfg = self.config.get("tls", {})
        return TLSConfig(
            enabled=tls_cfg.get("enabled", True),
            version=TLSVersion(tls_cfg.get("version", "TLSv1.3")),
            cert_path=tls_cfg.get("cert_path", ""),
            key_path=tls_cfg.get("key_path", ""),
            ca_path=tls_cfg.get("ca_path", ""),
            verify_mode=tls_cfg.get("verify_mode", "required"),
        )

    def setup_tls(self) -> Tuple[bool, str]:
        """Set up TLS with certificates."""
        if not self.tls_config.enabled:
            return True, "TLS disabled"

        # Generate self-signed if no cert provided
        if not self.tls_config.cert_path:
            cert_path, key_path = self.cert_manager.generate_self_signed()
            self.tls_config.cert_path = cert_path
            self.tls_config.key_path = key_path
            return True, f"Generated self-signed certificate: {cert_path}"

        # Validate existing certificate
        valid, issues = self.cert_manager.validate_certificate(
            self.tls_config.cert_path
        )

        if valid:
            return True, "TLS configured successfully"
        else:
            return False, f"Certificate issues: {', '.join(issues)}"

    def run_security_audit(self) -> Dict[str, Any]:
        """Run a complete security audit."""
        cert_paths = []
        if self.tls_config.cert_path:
            cert_paths.append(self.tls_config.cert_path)
        if self.tls_config.key_path:
            cert_paths.append(self.tls_config.key_path)

        return self.auditor.run_full_audit(
            config=self.config,
            cert_paths=cert_paths,
        )

    def check_request(
        self,
        source_ip: str,
        operation: str,
        context: Optional[Dict[str, Any]] = None
    ) -> Tuple[bool, str]:
        """Check if a request should be allowed."""
        # Check if IP is banned
        if self.intrusion_detector.is_banned(source_ip):
            return False, "IP is banned"

        # Check security policies
        allowed, reason = self.policy_enforcer.check_operation(
            operation,
            context or {},
        )

        return allowed, reason

    def get_security_status(self) -> Dict[str, Any]:
        """Get current security status."""
        return {
            "tls_enabled": self.tls_config.enabled,
            "tls_version": self.tls_config.version.value,
            "policies_count": len(self.policy_enforcer.policies),
            "banned_ips": len(self.intrusion_detector.banned_ips),
            "recent_events": len(self.intrusion_detector.get_recent_events()),
        }


# Import threading for locks
import threading


# ============================================================================
# CLI Entry Point
# ============================================================================

def main():
    """Main CLI entry point."""
    import argparse

    parser = argparse.ArgumentParser(description="Infinite Map Security Hardening")
    parser.add_argument(
        "--audit",
        action="store_true",
        help="Run security audit"
    )
    parser.add_argument(
        "--generate-cert",
        action="store_true",
        help="Generate self-signed certificate"
    )
    parser.add_argument(
        "--common-name",
        default="infinite-map",
        help="Common name for certificate"
    )
    parser.add_argument(
        "--config",
        help="Path to configuration file (JSON)"
    )

    args = parser.parse_args()

    # Load config if provided
    config = {}
    if args.config:
        try:
            with open(args.config) as f:
                config = json.load(f)
        except Exception as e:
            print(f"Failed to load config: {e}")
            return 1

    manager = SecurityHardeningManager(config)

    if args.generate_cert:
        cert_path, key_path = manager.cert_manager.generate_self_signed(
            common_name=args.common_name
        )
        print(f"Generated certificate: {cert_path}")
        print(f"Generated key: {key_path}")
        return 0

    if args.audit:
        report = manager.run_security_audit()
        manager.auditor.print_report(report)

        # Return non-zero if security score is low
        if report["security_score"] < 70:
            return 1
        return 0

    # Default: show status
    status = manager.get_security_status()
    print("Security Status:")
    print(json.dumps(status, indent=2))
    return 0


if __name__ == "__main__":
    sys.exit(main())
