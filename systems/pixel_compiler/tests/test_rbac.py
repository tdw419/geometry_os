"""
Comprehensive tests for Role-Based Access Control (RBAC) system.

Tests cover:
- Permission creation and parsing
- Role definitions and management
- User management with roles
- Permission checking with scope matching
- Decorator-based authorization
- System role protection
- Edge cases and error handling
"""

import pytest
from functools import wraps

from systems.pixel_compiler.auth.permissions import (
    Resource,
    Action,
    Permission,
    ROLE_DEFINITIONS,
)
from systems.pixel_compiler.auth.rbac import (
    Role,
    User,
    RBACEngine,
    require_permission,
)


class TestPermission:
    """Test Permission dataclass functionality."""

    def test_permission_creation(self):
        """Test creating a permission with resource, actions, and scope."""
        perm = Permission(
            resource=Resource.FILES,
            actions={Action.READ, Action.CREATE},
            scope="files:*"
        )
        assert perm.resource == Resource.FILES
        assert perm.actions == {Action.READ, Action.CREATE}
        assert perm.scope == "files:*"

    def test_permission_from_string(self):
        """Test parsing permission from string format 'resource:action:scope'."""
        perm = Permission.from_string("files:read:files:*")
        assert perm.resource == Resource.FILES
        assert perm.actions == {Action.READ}
        assert perm.scope == "files:*"

    def test_permission_from_string_multiple_actions(self):
        """Test parsing permission with multiple actions."""
        perm = Permission.from_string("files:read,create,update:files:*")
        assert perm.resource == Resource.FILES
        assert perm.actions == {Action.READ, Action.CREATE, Action.UPDATE}
        assert perm.scope == "files:*"

    def test_permission_from_string_wildcard_action(self):
        """Test parsing permission with wildcard action."""
        perm = Permission.from_string("files:*:files:*")
        assert perm.resource == Resource.FILES
        assert perm.actions == set(Action)  # All actions

    def test_permission_from_string_no_scope(self):
        """Test parsing permission without scope (defaults to resource:*)."""
        perm = Permission.from_string("files:read")
        assert perm.resource == Resource.FILES
        assert perm.actions == {Action.READ}
        assert perm.scope == "files:*"

    def test_permission_from_string_invalid_format(self):
        """Test parsing invalid permission string raises error."""
        with pytest.raises(ValueError):
            Permission.from_string("invalid")

    def test_permission_matches_scope_wildcard(self):
        """Test scope matching with wildcard."""
        perm = Permission(
            resource=Resource.FILES,
            actions={Action.READ},
            scope="files:*"
        )
        assert perm.matches_scope("files:123")
        assert perm.matches_scope("files:test")
        assert not perm.matches_scope("benchmarks:123")

    def test_permission_matches_scope_specific(self):
        """Test scope matching with specific resource ID."""
        perm = Permission(
            resource=Resource.FILES,
            actions={Action.READ},
            scope="files:123"
        )
        assert perm.matches_scope("files:123")
        assert not perm.matches_scope("files:456")

    def test_permission_matches_scope_pattern(self):
        """Test scope matching with fnmatch pattern."""
        perm = Permission(
            resource=Resource.FILES,
            actions={Action.READ},
            scope="files:temp-*"
        )
        assert perm.matches_scope("files:temp-123")
        assert perm.matches_scope("files:temp-file")
        assert not perm.matches_scope("files:123")


class TestRoleDefinitions:
    """Test predefined system role definitions."""

    def test_viewer_role_exists(self):
        """Test viewer role has correct permissions."""
        assert "viewer" in ROLE_DEFINITIONS
        viewer = ROLE_DEFINITIONS["viewer"]
        assert "files:read:files:*" in viewer
        assert "benchmarks:read:benchmarks:*" in viewer
        assert "dashboard:read:dashboard:*" in viewer

    def test_operator_role_exists(self):
        """Test operator role has correct permissions."""
        assert "operator" in ROLE_DEFINITIONS
        operator = ROLE_DEFINITIONS["operator"]
        # Operator should have viewer permissions plus more
        assert any("files:execute" in p for p in operator)
        assert any("benchmarks:create" in p for p in operator)

    def test_admin_role_exists(self):
        """Test admin role has wildcard permissions."""
        assert "admin" in ROLE_DEFINITIONS
        admin = ROLE_DEFINITIONS["admin"]
        assert "*:*:*" in admin

    def test_auditor_role_exists(self):
        """Test auditor role has correct permissions."""
        assert "auditor" in ROLE_DEFINITIONS
        auditor = ROLE_DEFINITIONS["auditor"]
        assert "files:read:files:*" in auditor
        assert "audit_logs:read:audit_logs:*" in auditor


class TestRole:
    """Test Role dataclass functionality."""

    def test_role_creation(self):
        """Test creating a custom role."""
        role = Role(
            name="custom_role",
            description="A custom role",
            permissions=[
                Permission.from_string("files:read:files:*"),
                Permission.from_string("files:delete:files:*"),
            ],
            is_system=False
        )
        assert role.name == "custom_role"
        assert role.description == "A custom role"
        assert len(role.permissions) == 2
        assert not role.is_system

    def test_role_from_definition(self):
        """Test creating role from ROLE_DEFINITIONS."""
        role = Role.from_definition("viewer", ROLE_DEFINITIONS["viewer"])
        assert role.name == "viewer"
        assert role.is_system
        assert len(role.permissions) >= 3

    def test_role_has_permission(self):
        """Test checking if role has specific permission."""
        role = Role.from_definition("viewer", ROLE_DEFINITIONS["viewer"])
        assert role.has_permission(Resource.FILES, Action.READ)
        assert not role.has_permission(Resource.FILES, Action.DELETE)


class TestUser:
    """Test User dataclass functionality."""

    def test_user_creation(self):
        """Test creating a user."""
        user = User(
            id="user123",
            username="testuser",
            email="test@example.com",
            roles=["viewer"],
            enabled=True
        )
        assert user.id == "user123"
        assert user.username == "testuser"
        assert user.email == "test@example.com"
        assert user.roles == ["viewer"]
        assert user.enabled

    def test_user_disabled(self):
        """Test creating a disabled user."""
        user = User(
            id="user123",
            username="testuser",
            email="test@example.com",
            roles=["admin"],
            enabled=False
        )
        assert not user.enabled


class TestRBACEngine:
    """Test RBACEngine core functionality."""

    def test_engine_initialization(self):
        """Test engine loads system roles on init."""
        engine = RBACEngine()
        assert "viewer" in engine._roles
        assert "operator" in engine._roles
        assert "admin" in engine._roles
        assert "auditor" in engine._roles

    def test_get_all_roles(self):
        """Test getting all roles."""
        engine = RBACEngine()
        roles = engine.get_all_roles()
        assert len(roles) >= 4
        role_names = {r.name for r in roles}
        assert "viewer" in role_names
        assert "operator" in role_names
        assert "admin" in role_names
        assert "auditor" in role_names

    def test_get_role(self):
        """Test getting specific role."""
        engine = RBACEngine()
        role = engine.get_role("viewer")
        assert role is not None
        assert role.name == "viewer"
        assert role.is_system

    def test_create_role(self):
        """Test creating a custom role."""
        engine = RBACEngine()
        permissions = [
            Permission.from_string("files:read:files:*"),
            Permission.from_string("files:update:files:*"),
        ]
        role = engine.create_role(
            name="editor",
            description="Can edit files",
            permissions=permissions
        )
        assert role.name == "editor"
        assert not role.is_system
        assert "editor" in engine._roles

    def test_create_duplicate_role(self):
        """Test creating duplicate role raises error."""
        engine = RBACEngine()
        engine.create_role(
            name="custom",
            description="First",
            permissions=[Permission.from_string("files:read:files:*")]
        )
        with pytest.raises(ValueError, match="already exists"):
            engine.create_role(
                name="custom",
                description="Second",
                permissions=[Permission.from_string("files:read:files:*")]
            )

    def test_update_role(self):
        """Test updating role permissions."""
        engine = RBACEngine()
        engine.create_role(
            name="custom",
            description="Custom role",
            permissions=[Permission.from_string("files:read:files:*")]
        )
        new_permissions = [
            Permission.from_string("files:read:files:*"),
            Permission.from_string("files:update:files:*"),
        ]
        updated = engine.update_role("custom", new_permissions)
        assert len(updated.permissions) == 2

    def test_update_system_role_fails(self):
        """Test updating system role raises error."""
        engine = RBACEngine()
        with pytest.raises(ValueError, match="system role"):
            engine.update_role("admin", [])

    def test_delete_role(self):
        """Test deleting custom role."""
        engine = RBACEngine()
        engine.create_role(
            name="temp_role",
            description="Temporary",
            permissions=[Permission.from_string("files:read:files:*")]
        )
        assert "temp_role" in engine._roles
        engine.delete_role("temp_role")
        assert "temp_role" not in engine._roles

    def test_delete_system_role_fails(self):
        """Test deleting system role raises error."""
        engine = RBACEngine()
        with pytest.raises(ValueError, match="system role"):
            engine.delete_role("admin")

    def test_create_user(self):
        """Test creating a user."""
        engine = RBACEngine()
        user = engine.create_user(
            user_id="user1",
            username="testuser",
            email="test@example.com",
            roles=["viewer"]
        )
        assert user.id == "user1"
        assert user.username == "testuser"
        assert "viewer" in user.roles
        assert "user1" in engine._users

    def test_create_duplicate_user(self):
        """Test creating duplicate user raises error."""
        engine = RBACEngine()
        engine.create_user("user1", "test", "test@example.com")
        with pytest.raises(ValueError, match="already exists"):
            engine.create_user("user1", "test2", "test2@example.com")

    def test_get_user(self):
        """Test getting user by ID."""
        engine = RBACEngine()
        engine.create_user("user1", "test", "test@example.com")
        user = engine.get_user("user1")
        assert user is not None
        assert user.username == "test"

    def test_add_role_to_user(self):
        """Test adding role to user."""
        engine = RBACEngine()
        engine.create_user("user1", "test", "test@example.com", roles=["viewer"])
        engine.add_role_to_user("user1", "operator")
        user = engine.get_user("user1")
        assert "operator" in user.roles

    def test_remove_role_from_user(self):
        """Test removing role from user."""
        engine = RBACEngine()
        engine.create_user("user1", "test", "test@example.com", roles=["viewer", "operator"])
        engine.remove_role_from_user("user1", "operator")
        user = engine.get_user("user1")
        assert "operator" not in user.roles

    def test_check_permission_viewer(self):
        """Test permission check for viewer role."""
        engine = RBACEngine()
        engine.create_user("user1", "viewer", "test@example.com", roles=["viewer"])

        # Viewer should be able to read
        assert engine.check_permission("user1", Resource.FILES, Action.READ)
        assert engine.check_permission("user1", Resource.BENCHMARKS, Action.READ)

        # Viewer should NOT be able to create
        assert not engine.check_permission("user1", Resource.FILES, Action.CREATE)
        assert not engine.check_permission("user1", Resource.FILES, Action.DELETE)

    def test_check_permission_operator(self):
        """Test permission check for operator role."""
        engine = RBACEngine()
        engine.create_user("user1", "operator", "test@example.com", roles=["operator"])

        # Operator should be able to create and execute
        assert engine.check_permission("user1", Resource.FILES, Action.CREATE)
        assert engine.check_permission("user1", Resource.FILES, Action.EXECUTE)
        assert engine.check_permission("user1", Resource.BENCHMARKS, Action.CREATE)

    def test_check_permission_admin(self):
        """Test admin has all permissions."""
        engine = RBACEngine()
        engine.create_user("admin1", "admin", "admin@example.com", roles=["admin"])

        # Admin should have access to everything
        assert engine.check_permission("admin1", Resource.FILES, Action.READ)
        assert engine.check_permission("admin1", Resource.FILES, Action.DELETE)
        assert engine.check_permission("admin1", Resource.USERS, Action.CREATE)
        assert engine.check_permission("admin1", Resource.SETTINGS, Action.UPDATE)

    def test_check_permission_auditor(self):
        """Test auditor has read-only access."""
        engine = RBACEngine()
        engine.create_user("auditor1", "auditor", "audit@example.com", roles=["auditor"])

        # Auditor can read
        assert engine.check_permission("auditor1", Resource.FILES, Action.READ)
        assert engine.check_permission("auditor1", Resource.AUDIT_LOGS, Action.READ)

        # Auditor cannot write
        assert not engine.check_permission("auditor1", Resource.FILES, Action.CREATE)
        assert not engine.check_permission("auditor1", Resource.AUDIT_LOGS, Action.UPDATE)

    def test_check_permission_disabled_user(self):
        """Test disabled user has no permissions."""
        engine = RBACEngine()
        engine.create_user("user1", "test", "test@example.com", roles=["admin"])
        user = engine.get_user("user1")
        user.enabled = False

        # Disabled user should have no permissions
        assert not engine.check_permission("user1", Resource.FILES, Action.READ)

    def test_check_permission_with_resource_id(self):
        """Test permission check with specific resource ID."""
        engine = RBACEngine()

        # Create user with specific scope permission
        engine.create_user("user1", "test", "test@example.com")
        engine._users["user1"].direct_permissions = [
            Permission.from_string("files:read:files:123")
        ]

        # Should have access to specific file
        assert engine.check_permission("user1", Resource.FILES, Action.READ, "files:123")

        # Should NOT have access to other files
        assert not engine.check_permission("user1", Resource.FILES, Action.READ, "files:456")

    def test_check_permission_nonexistent_user(self):
        """Test permission check for nonexistent user returns False."""
        engine = RBACEngine()
        assert not engine.check_permission("nonexistent", Resource.FILES, Action.READ)

    def test_get_user_permissions(self):
        """Test getting all user permissions."""
        engine = RBACEngine()
        engine.create_user("user1", "test", "test@example.com", roles=["viewer"])
        permissions = engine.get_user_permissions("user1")
        assert len(permissions) > 0
        assert any(p.resource == Resource.FILES and Action.READ in p.actions for p in permissions)

    def test_get_user_permissions_with_direct(self):
        """Test getting user permissions includes direct permissions."""
        engine = RBACEngine()
        engine.create_user("user1", "test", "test@example.com")
        engine._users["user1"].direct_permissions = [
            Permission.from_string("files:delete:files:*")
        ]
        permissions = engine.get_user_permissions("user1")
        assert any(p.resource == Resource.FILES and Action.DELETE in p.actions for p in permissions)


class TestRequirePermissionDecorator:
    """Test the @require_permission decorator."""

    def test_decorator_grants_access(self):
        """Test decorator allows access when user has permission."""
        engine = RBACEngine()
        engine.create_user("user1", "test", "test@example.com", roles=["admin"])

        @require_permission(Resource.FILES, Action.READ, engine)
        def read_files(user_id):
            return f"Files for {user_id}"

        result = read_files("user1")
        assert result == "Files for user1"

    def test_decorator_denies_access(self):
        """Test decorator denies access when user lacks permission."""
        engine = RBACEngine()
        engine.create_user("user1", "viewer", "test@example.com", roles=["viewer"])

        @require_permission(Resource.FILES, Action.DELETE, engine)
        def delete_files(user_id):
            return f"Deleted files for {user_id}"

        with pytest.raises(PermissionError):
            delete_files("user1")

    def test_decorator_with_resource_id_param(self):
        """Test decorator checks specific resource ID."""
        engine = RBACEngine()
        engine.create_user("user1", "test", "test@example.com")
        engine._users["user1"].direct_permissions = [
            Permission.from_string("files:read:files:123")
        ]

        @require_permission(Resource.FILES, Action.READ, engine, "file_id")
        def read_file(user_id, file_id):
            return f"Reading file {file_id}"

        # Should work for file:123
        assert read_file("user1", "files:123") == "Reading file files:123"

        # Should fail for file:456
        with pytest.raises(PermissionError):
            read_file("user1", "files:456")

    def test_decorator_with_custom_param_name(self):
        """Test decorator with custom user_id parameter."""
        engine = RBACEngine()
        engine.create_user("user1", "admin", "test@example.com", roles=["admin"])

        @require_permission(Resource.FILES, Action.READ, engine, user_id_param="operator_id")
        def read_files(operator_id):
            return f"Files accessed by {operator_id}"

        result = read_files("user1")
        assert result == "Files accessed by user1"


class TestEdgeCases:
    """Test edge cases and error handling."""

    def test_empty_role_list(self):
        """Test user with no roles."""
        engine = RBACEngine()
        engine.create_user("user1", "test", "test@example.com", roles=[])
        assert not engine.check_permission("user1", Resource.FILES, Action.READ)

    def test_wildcard_permission_matches_all(self):
        """Test wildcard permission matches all resources."""
        engine = RBACEngine()
        engine.create_user("user1", "test", "test@example.com")
        engine._users["user1"].direct_permissions = [
            Permission.from_string("*:*:*")
        ]

        assert engine.check_permission("user1", Resource.FILES, Action.READ)
        assert engine.check_permission("user1", Resource.USERS, Action.DELETE)
        assert engine.check_permission("user1", Resource.SETTINGS, Action.UPDATE)

    def test_role_with_wildcard_action(self):
        """Test role with wildcard action has all actions on resource."""
        engine = RBACEngine()
        engine.create_role(
            name="file_master",
            description="Master of files",
            permissions=[Permission.from_string("files:*:files:*")]
        )

        role = engine.get_role("file_master")
        assert role.has_permission(Resource.FILES, Action.READ)
        assert role.has_permission(Resource.FILES, Action.CREATE)
        assert role.has_permission(Resource.FILES, Action.DELETE)

    def test_multiple_roles_cumulative(self):
        """Test user with multiple roles has cumulative permissions."""
        engine = RBACEngine()

        # Create limited role
        engine.create_role(
            name="reader",
            description="Read only",
            permissions=[Permission.from_string("files:read:files:*")]
        )

        # Create writer role
        engine.create_role(
            name="writer",
            description="Write only",
            permissions=[Permission.from_string("files:create:files:*")]
        )

        engine.create_user("user1", "test", "test@example.com", roles=["reader", "writer"])

        # User should have both read and create
        assert engine.check_permission("user1", Resource.FILES, Action.READ)
        assert engine.check_permission("user1", Resource.FILES, Action.CREATE)

    def test_direct_permissions_override(self):
        """Test direct permissions add to role permissions."""
        engine = RBACEngine()
        engine.create_user("user1", "test", "test@example.com", roles=["viewer"])
        engine._users["user1"].direct_permissions = [
            Permission.from_string("files:delete:files:*")
        ]

        # Should have read from role and delete from direct
        assert engine.check_permission("user1", Resource.FILES, Action.READ)
        assert engine.check_permission("user1", Resource.FILES, Action.DELETE)

    def test_scope_matching_with_fnmatch(self):
        """Test fnmatch patterns work correctly."""
        engine = RBACEngine()
        engine.create_user("user1", "test", "test@example.com")
        engine._users["user1"].direct_permissions = [
            Permission.from_string("files:read:files:temp-*")
        ]

        assert engine.check_permission("user1", Resource.FILES, Action.READ, "files:temp-123")
        assert engine.check_permission("user1", Resource.FILES, Action.READ, "files:temp-file")
        assert not engine.check_permission("user1", Resource.FILES, Action.READ, "files:permanent")
