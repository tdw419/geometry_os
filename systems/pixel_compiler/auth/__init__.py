"""
Authentication and Authorization Module for PixelRTS Phase 4 Security

This module provides:
- OAuth2/OpenID Connect authentication
- JWT token management and validation
- Session management for token refresh
- Role-based access control (RBAC) for the PixelRTS system
- API key management with rate limiting
- Encryption and secure storage
"""

try:
    from .permissions import (
        Resource,
        Action,
        Permission,
        ROLE_DEFINITIONS,
    )
    _has_permissions = True
except ImportError:
    _has_permissions = False

try:
    from .rbac import (
        Role,
        User,
        RBACEngine,
        require_permission,
    )
    _has_rbac = True
except ImportError:
    _has_rbac = False

try:
    from .encryption import EncryptionManager
    _has_encryption = True
except ImportError:
    _has_encryption = False

try:
    from .secure_storage import SecureStorage, SecureMetadataStore
    _has_secure_storage = True
except ImportError:
    _has_secure_storage = False

# OAuth2/OpenID Connect
try:
    from .oauth2_provider import (
        OAuth2Config,
        OAuth2Provider,
        OAuth2Error,
        TokenResponse,
        UserInfo,
    )
    _has_oauth2 = True
except ImportError:
    _has_oauth2 = False

# JWT Middleware
try:
    from .jwt_middleware import (
        JWTConfig,
        TokenPayload,
        JWTManager,
        AuthMiddleware,
    )
    _has_jwt = True
except ImportError:
    _has_jwt = False

# Token Manager
try:
    from .token_manager import (
        Session,
        TokenManager,
    )
    _has_token_manager = True
except ImportError:
    _has_token_manager = False

# API Keys
try:
    from .api_keys import (
        APIKeyManager,
        APIKey,
        ResourceType,
        Action as APIKeyAction,
        KEY_PREFIX,
    )
    _has_api_keys = True
except ImportError:
    _has_api_keys = False

# Rate Limiter
try:
    from .rate_limiter import (
        RateLimiter,
        RateLimitStatus,
        RateLimitExceeded,
    )
    _has_rate_limiter = True
except ImportError:
    _has_rate_limiter = False

__all__ = []

if _has_oauth2:
    __all__.extend([
        'OAuth2Config',
        'OAuth2Provider',
        'OAuth2Error',
        'TokenResponse',
        'UserInfo',
    ])

if _has_jwt:
    __all__.extend([
        'JWTConfig',
        'TokenPayload',
        'JWTManager',
        'AuthMiddleware',
    ])

if _has_token_manager:
    __all__.extend([
        'Session',
        'TokenManager',
    ])

if _has_api_keys:
    __all__.extend([
        'APIKeyManager',
        'APIKey',
        'ResourceType',
        'APIKeyAction',
        'KEY_PREFIX',
    ])

if _has_rate_limiter:
    __all__.extend([
        'RateLimiter',
        'RateLimitStatus',
        'RateLimitExceeded',
    ])

# Audit Logger
from .audit_logger import (
    AuditEventType,
    AuditEventStatus,
    AuditEvent,
    AuditLogConfig,
    AuditLogger,
    get_audit_logger,
    log_event,
)

__all__.extend([
    'AuditEventType',
    'AuditEventStatus',
    'AuditEvent',
    'AuditLogConfig',
    'AuditLogger',
    'get_audit_logger',
    'log_event',
])

if _has_encryption:
    __all__.append('EncryptionManager')

if _has_secure_storage:
    __all__.extend(['SecureStorage', 'SecureMetadataStore'])

if _has_permissions:
    __all__.extend([
        'Resource',
        'Action',
        'Permission',
        'ROLE_DEFINITIONS',
    ])

if _has_rbac:
    __all__.extend([
        'Role',
        'User',
        'RBACEngine',
        'require_permission',
    ])
