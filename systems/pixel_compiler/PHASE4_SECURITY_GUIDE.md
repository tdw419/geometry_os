# PixelRTS Phase 4 Security Guide

## Quick Start

### Installation

The security features are included in the `pixel_compiler` module. Ensure you have the required dependencies:

```bash
pip install pyjwt cryptography
```

### Basic Authentication

1. **Create your first user:**

```bash
# The first user must be created manually
python -c "
from systems.pixel_compiler.auth.cli_auth import AuthContext
ctx = AuthContext()
ctx.create_user('admin', 'admin@example.com', 'YourSecurePassword123!', ['admin'])
print('Admin user created')
"
```

2. **Login to the CLI:**

```bash
python -m systems.pixel_compiler.pixelrts_v3_cli auth login -u admin
# Enter password when prompted
```

3. **Use protected commands:**

```bash
# Convert a file with authentication
python -m systems.pixel_compiler.pixelrts_v3_cli convert input.bin output.rts.png --protected
```

4. **Check your status:**

```bash
python -m systems.pixel_compiler.pixelrts_v3_cli auth status
```

5. **Logout when done:**

```bash
python -m systems.pixel_compiler.pixelrts_v3_cli auth logout
```

## OAuth2 Configuration

### Keycloak Setup

1. **Create a Keycloak realm and client:**

```bash
# Using Keycloak Admin CLI
kcadm.sh create clients -r master \
  -s clientId=pixelrts \
  -s secret=your-client-secret \
  -s redirectUris=["http://localhost:8080/*"] \
  -s enabled=true
```

2. **Configure PixelRTS:**

```python
from auth.oauth2_provider import OAuth2Provider

provider = OAuth2Provider(
    provider_name="keycloak",
    client_id="pixelrts",
    client_secret="your-client-secret",
    authorization_url="http://localhost:8080/realms/pixelrts/protocol/openid-connect/auth",
    token_url="http://localhost:8080/realms/pixelrts/protocol/openid-connect/token",
    userinfo_url="http://localhost:8080/realms/pixelrts/protocol/openid-connect/userinfo"
)
```

### Auth0 Setup

```python
from auth.oauth2_provider import OAuth2Provider

provider = OAuth2Provider(
    provider_name="auth0",
    client_id="your-auth0-client-id",
    client_secret="your-auth0-client-secret",
    authorization_url="https://your-tenant.auth0.com/authorize",
    token_url="https://your-tenant.auth0.com/oauth/token",
    userinfo_url="https://your-tenant.auth0.com/userinfo",
    scope="openid profile email"
)
```

### Okta Setup

```python
from auth.oauth2_provider import OAuth2Provider

provider = OAuth2Provider(
    provider_name="okta",
    client_id="your-okta-client-id",
    client_secret="your-okta-client-secret",
    authorization_url="https://your-domain.okta.com/oauth2/v1/authorize",
    token_url="https://your-domain.okta.com/oauth2/v1/token",
    userinfo_url="https://your-domain.okta.com/oauth2/v1/userinfo"
)
```

### Google OAuth2 Setup

1. **Create credentials in Google Cloud Console:**
   - Go to APIs & Services > Credentials
   - Create OAuth 2.0 Client ID
   - Add redirect URI: `http://localhost:8080/callback`

2. **Configure PixelRTS:**

```python
from auth.oauth2_provider import OAuth2Provider

provider = OAuth2Provider(
    provider_name="google",
    client_id="your-google-client-id.apps.googleusercontent.com",
    client_secret="your-google-client-secret",
    authorization_url="https://accounts.google.com/o/oauth2/v2/auth",
    token_url="https://oauth2.googleapis.com/token",
    userinfo_url="https://www.googleapis.com/oauth2/v2/userinfo",
    scope="openid email profile"
)
```

## Role-Based Access Control (RBAC)

### Available Roles

| Role | Permissions |
|------|-------------|
| **viewer** | Read-only access to files, benchmarks, and dashboard |
| **operator** | Create and execute files, run benchmarks |
| **admin** | Full access to all resources and user management |
| **auditor** | Read-only access to audit logs and all resources |

### Creating Users with Roles

```bash
# Create an operator
python -m systems.pixel_compiler.pixelrts_v3_cli auth create-user \
  -u operator1 \
  -e operator1@example.com \
  -r operator

# Create an auditor
python -m systems.pixel_compiler.pixelrts_v3_cli auth create-user \
  -u auditor1 \
  -e auditor1@example.com \
  -r auditor

# Create an admin
python -m systems.pixel_compiler.pixelrts_v3_cli auth create-user \
  -u admin2 \
  -e admin2@example.com \
  -r admin

# Create a user with multiple roles
python -c "
from systems.pixel_compiler.auth.cli_auth import AuthContext
ctx = AuthContext()
ctx.create_user('poweruser', 'power@example.com', 'Password123!', ['admin', 'auditor'])
"
```

### Checking Permissions

```python
from auth.rbac import RBACEngine

engine = RBACEngine()
user = engine.get_user('username')

# Check if user has permission
if engine.has_permission(user, 'files', 'create'):
    print("User can create files")

# Get all user permissions
permissions = engine.get_user_permissions(user)
print(f"User permissions: {permissions}")
```

## API Key Usage

### Creating an API Key

```python
from auth.apikey_manager import APIKeyManager

manager = APIKeyManager()
api_key = manager.create_key(
    user_id='username',
    name='My API Key',
    scopes=['files:read', 'files:create'],
    rate_limit=100  # requests per hour
)

print(f"API Key: {api_key.key}")
print(f"Secret: {api_key.secret}")  # Store this securely!
```

### Using an API Key

```bash
# Use API key in request header
curl -H "X-API-Key: your-api-key" \
  http://localhost:8080/api/convert
```

```python
import requests

headers = {'X-API-Key': 'your-api-key'}
response = requests.post(
    'http://localhost:8080/api/convert',
    headers=headers,
    json={'input': 'file.bin', 'output': 'file.rts.png'}
)
```

### Managing API Keys

```python
from auth.apikey_manager import APIKeyManager

manager = APIKeyManager()

# List all keys for a user
keys = manager.list_keys(user_id='username')

# Revoke a key
manager.revoke_key(key_id='key-id')

# Update rate limit
manager.update_key(key_id='key-id', rate_limit=200)
```

## Encrypted Storage

### Encrypting Data

```python
from auth.crypto import encrypt_data, decrypt_data

# Encrypt sensitive data
plaintext = b"Sensitive data to encrypt"
encrypted = encrypt_data(plaintext, encryption_key)

# Save encrypted data
with open('encrypted.bin', 'wb') as f:
    f.write(encrypted)
```

### Decrypting Data

```python
from auth.crypto import encrypt_data, decrypt_data

# Load encrypted data
with open('encrypted.bin', 'rb') as f:
    encrypted = f.read()

# Decrypt data
decrypted = decrypt_data(encrypted, encryption_key)
print(decrypted.decode())
```

### Setting Up Encryption Keys

```bash
# Generate a secure encryption key
python -c "import secrets; print(secrets.token_bytes(32).hex())"

# Set as environment variable
export PIXELRTS_ENCRYPTION_KEY=your-32-byte-hex-key

# Or pass to AuthContext
from auth.cli_auth import AuthContext
ctx = AuthContext(encryption_key=bytes.fromhex(os.getenv('PIXELRTS_ENCRYPTION_KEY')))
```

## Audit Logging

### Querying Audit Logs

```python
from auth.audit_logger import AuditLogger

logger = AuditLogger()

# Query all logs for a user
logs = logger.query(user_id='username')

# Query by action
logs = logger.query(action='files:create')

# Query by resource
logs = logger.query(resource_id='files:123')

# Query by date range
from datetime import datetime, timedelta
logs = logger.query(
    start_time=datetime.now() - timedelta(hours=24),
    end_time=datetime.now()
)
```

### Exporting Audit Logs

```python
from auth.audit_logger import AuditLogger

logger = AuditLogger()

# Export to JSON
logger.export_to_json('audit_logs.json')

# Export to CSV
logger.export_to_csv('audit_logs.csv')

# Export with filters
logger.export_to_json(
    'user_activity.json',
    user_id='username',
    start_time=datetime(2024, 1, 1)
)
```

### Monitoring Audit Trails

```bash
# Real-time monitoring
tail -f ~/.pixelrts/audit.log | grep "files:create"

# Summary statistics
python -c "
from auth.audit_logger import AuditLogger
logger = AuditLogger()
stats = logger.get_statistics()
print(f'Total events: {stats[\"total\"]}')
print(f'Users: {stats[\"unique_users\"]}')
print(f'Top actions: {stats[\"top_actions\"]}')
"
```

## Compliance Features

### GDPR Compliance

```python
from auth.cli_auth import AuthContext
from auth.audit_logger import AuditLogger

ctx = AuthContext()
logger = AuditLogger()

# Right to erasure (delete user and all data)
def erase_user_data(username):
    # Delete user account
    del ctx.users[username]
    ctx._save_users()

    # Log the erasure
    logger.log(
        action='user:delete',
        user_id='admin',
        resource_id=f'users:{username}',
        details={'reason': 'GDPR right to erasure'}
    )

    # Delete user's audit logs (or anonymize)
    logger.anonymize_user_logs(username)

# Right to data export
def export_user_data(username):
    user = ctx.users.get(username)
    logs = logger.query(user_id=username)

    return {
        'user_profile': user,
        'activity_log': logs
    }

# Consent tracking
def record_consent(username, consent_type):
    logger.log(
        action='consent:given',
        user_id=username,
        details={'consent_type': consent_type, 'timestamp': datetime.now().isoformat()}
    )
```

### SOC2 Compliance

```python
# Enable comprehensive audit logging
from auth.audit_logger import AuditLogger, AuditEvent

logger = AuditLogger()
logger.enable_comprehensive_logging()

# Log all access attempts
logger.log_access_attempt(username, resource, action, success)

# Monitor for suspicious activity
def detect_suspicious_activity(username):
    logs = logger.query(user_id=username)

    # Check for failed login attempts
    failed_logins = [l for l in logs if l.action == 'auth:login' and not l.success]

    if len(failed_logins) > 5:
        logger.log_security_event(
            event_type='multiple_failed_logins',
            user_id=username,
            details={'attempts': len(failed_logins)}
        )
        return True

    return False

# Access control verification
def verify_access_control(user, resource, action):
    from auth.rbac import RBACEngine
    engine = RBACEngine()

    has_access = engine.has_permission(user, resource, action)

    logger.log(
        action='access_control:check',
        user_id=user['username'],
        resource_id=f'{resource}:{action}',
        details={'authorized': has_access}
    )

    return has_access
```

### HIPAA Compliance

```python
# PHI (Protected Health Information) encryption
def store_phi(data, encryption_key):
    from auth.crypto import encrypt_data

    encrypted = encrypt_data(data.encode(), encryption_key)

    # Log access without exposing PHI
    logger.log(
        action='phi:create',
        user_id='username',
        resource_id='phi:record-id',
        details={'size': len(data), 'encrypted': True}
    )

    return encrypted

# Audit trail for PHI access
def log_phi_access(user_id, phi_id, purpose):
    logger.log(
        action='phi:access',
        user_id=user_id,
        resource_id=f'phi:{phi_id}',
        details={
            'purpose': purpose,
            'minimum_necessary': True,
            'authorization': valid
        }
    )

# Authentication requirements
def authenticate_hipaa_user(username, password):
    from auth.cli_auth import AuthContext

    ctx = AuthContext()
    user = ctx.authenticate(username, password)

    if user:
        # Log successful authentication
        logger.log(
            action='auth:login',
            user_id=username,
            details={'method': 'password', 'mfa_enabled': True}
        )
        return user

    # Log failed attempt
    logger.log(
        action='auth:login',
        user_id=username,
        details={'method': 'password', 'success': False}
    )
    return None
```

## Security Best Practices

### 1. Use Strong Passwords

```bash
# Generate a secure password
python -c "import secrets; print(secrets.choice(open('/usr/share/dict/words').readlines()).strip() + str(secrets.randbelow(10000)))"
```

### 2. Enable Multi-Factor Authentication (Future)

```python
# Coming soon: TOTP-based 2FA
from auth.mfa import enable_totp

# Enable 2FA for a user
enable_totp(username)
```

### 3. Rotate API Keys Regularly

```python
from auth.apikey_manager import APIKeyManager

manager = APIKeyManager()

# Rotate key
old_key = 'old-key-id'
new_key = manager.create_key(user_id='username', name='Rotated key')
manager.revoke_key(old_key)
```

### 4. Use Environment Variables for Secrets

```bash
# Never hardcode secrets
export PIXELRTS_SECRET_KEY=$(openssl rand -hex 32)
export PIXELRTS_ENCRYPTION_KEY=$(openssl rand -hex 32)
```

### 5. Regular Security Audits

```bash
# Run security audit
python -m systems.pixel_compiler.security.audit

# Review audit logs
python -c "
from auth.audit_logger import AuditLogger
logger = AuditLogger()
logger.export_to_json('security_audit.json')
"
```

### 6. Principle of Least Privilege

```python
# Assign minimum required permissions
# Instead of giving admin rights, give specific permissions
ctx.create_user(
    'limited_user',
    'user@example.com',
    'Password123!',
    ['operator']  # Only operator, not admin
)
```

### 7. Regular Backups

```bash
# Backup user data and audit logs
cp ~/.pixelrts/users.enc ~/.pixelrts/backups/users.enc.$(date +%Y%m%d)
cp ~/.pixelrts/audit.log ~/.pixelrts/backups/audit.log.$(date +%Y%m%d)
```

### 8. Monitor for Suspicious Activity

```python
# Set up alerts for suspicious patterns
from auth.audit_logger import AuditLogger

logger = AuditLogger()
suspicious = logger.detect_suspicious_patterns()

if suspicious:
    print("Suspicious activity detected:")
    for event in suspicious:
        print(f"  {event}")
```

### 9. Keep Dependencies Updated

```bash
# Regularly update security dependencies
pip install --upgrade pyjwt cryptography
pip install --upgrade safety
safety check
```

### 10. Use HTTPS in Production

```python
# Configure OAuth2 providers with HTTPS URLs
provider = OAuth2Provider(
    provider_name="production",
    authorization_url="https://auth.example.com/authorize",  # Use https://
    token_url="https://auth.example.com/token",
    # ...
)
```

## Troubleshooting

### "Authentication required" Error

```bash
# You need to login first
python -m systems.pixel_compiler.pixelrts_v3_cli auth login -u your-username
```

### "Invalid or expired token" Error

```bash
# Your session expired, login again
python -m systems.pixel_compiler.pixelrts_v3_cli auth login -u your-username
```

### "Permission denied" Error

```bash
# Check your current role
python -m systems.pixel_compiler.pixelrts_v3_cli auth status

# Contact admin to request additional permissions
```

### Reset Admin Password

```python
from auth.cli_auth import AuthContext

ctx = AuthContext()
# Directly update the password hash
ctx.users['admin']['password_hash'] = ctx._hash_password('NewPassword123!')
ctx._save_users()
print("Admin password reset")
```

## Additional Resources

- API Reference: See `docs/security/api-reference.md`
- Compliance Guide: See `docs/security/compliance.md`
- Example Code: See `examples/security/`
