"""
Authentication and Authorization Module for PixelRTS Phase 4 Security

This module provides:
- OAuth2/OpenID Connect authentication
- JWT token management and validation
- Session management for token refresh
- Role-based access control (RBAC) for the PixelRTS system
- API key management with rate limiting
- Encryption and secure storage
- Async authentication for improved scalability (cli_auth_async, api_keys_async, rate_limiter_async)
"""

try:
    from .permissions import (
        ROLE_DEFINITIONS,
        Action,
        Permission,
        Resource,
    )
    _has_permissions = True
except ImportError:
    _has_permissions = False

try:
    from .rbac import (
        RBACEngine,
        Role,
        User,
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
    from .secure_storage import SecureMetadataStore, SecureStorage
    _has_secure_storage = True
except ImportError:
    _has_secure_storage = False

# OAuth2/OpenID Connect
try:
    from .oauth2_provider import (
        OAuth2Config,
        OAuth2Error,
        OAuth2Provider,
        TokenResponse,
        UserInfo,
    )
    _has_oauth2 = True
except ImportError:
    _has_oauth2 = False

# JWT Middleware
try:
    from .jwt_middleware import (
        AuthMiddleware,
        JWTConfig,
        JWTManager,
        TokenPayload,
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
        KEY_PREFIX,
        APIKey,
        APIKeyManager,
        ResourceType,
    )
    from .api_keys import (
        Action as APIKeyAction,
    )
    _has_api_keys = True
except ImportError:
    _has_api_keys = False

# Rate Limiter
try:
    from .rate_limiter import (
        RateLimiter,
        RateLimitExceeded,
        RateLimitStatus,
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
try:
    from .audit_logger import (
        AuditEvent,
        AuditEventStatus,
        AuditEventType,
        AuditLogConfig,
        AuditLogger,
        get_audit_logger,
        log_event,
    )
    _has_audit_logger = True
except ImportError:
    _has_audit_logger = False

if _has_audit_logger:
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

# Async Authentication Modules
try:
    from .cli_auth_async import (
        AsyncAuthContext,
        SyncAuthContextWrapper,
        get_auth_context as get_async_auth_context,
        reset_auth_context,
        async_require_auth,
        require_auth_async,
    )
    _has_cli_auth_async = True
except ImportError:
    _has_cli_auth_async = False

try:
    from .api_keys_async import (
        AsyncAPIKeyManager,
        SyncAPIKeyManagerWrapper,
    )
    from .api_keys_async import (
        Action as AsyncAPIKeyAction,
        ResourceType as AsyncResourceType,
    )
    _has_api_keys_async = True
except ImportError:
    _has_api_keys_async = False

try:
    from .rate_limiter_async import (
        AsyncRateLimiter,
        RateLimitStatus as AsyncRateLimitStatus,
        RateLimitExceeded as AsyncRateLimitExceeded,
    )
    _has_rate_limiter_async = True
except ImportError:
    _has_rate_limiter_async = False

if _has_cli_auth_async:
    __all__.extend([
        'AsyncAuthContext',
        'SyncAuthContextWrapper',
        'get_async_auth_context',
        'reset_auth_context',
        'async_require_auth',
        'require_auth_async',
    ])

if _has_api_keys_async:
    __all__.extend([
        'AsyncAPIKeyManager',
        'SyncAPIKeyManagerWrapper',
        'AsyncAPIKeyAction',
        'AsyncResourceType',
    ])

if _has_rate_limiter_async:
    __all__.extend([
        'AsyncRateLimiter',
        'AsyncRateLimitStatus',
        'AsyncRateLimitExceeded',
    ])
