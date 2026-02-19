"""
Comprehensive tests for Infinite Map OS v3 Security module.

Tests cover:
- RBAC: Role definitions, permissions, user management
- ACL: Entry creation, inheritance, permission checking
- Integration between RBAC and ACL
- Edge cases and error handling

Run: PYTHONPATH=. python3 -m pytest systems/pixel_compiler/tests/test_rbac.py -v
"""

import pytest
import tempfile
from pathlib import Path
from datetime import datetime
from typing import Set

from systems.pixel_compiler.security.rbac import (
    Role,
    Permission,
    RolePermissions,
    UserRole,
    PermissionCheck,
    RBACManager,
    require_permission,
)
from systems.pixel_compiler.security.acl import (
    ACLEntry,
    AccessControlList,
    ACLManager,
)


# =============================================================================
# RBAC Tests
# =============================================================================

class TestRole:
    """Test Role enum."""

    def test_role_values(self):
        """Test that roles have expected values."""
        assert Role.ADMIN.value == "admin"
        assert Role.USER.value == "user"
        assert Role.GUEST.value == "guest"

    def test_all_roles_defined(self):
        """Test that all required roles are defined."""
        roles = {Role.ADMIN, Role.USER, Role.GUEST}
        assert set(Role) == roles


class TestPermission:
    """Test Permission enum."""

    def test_permission_values(self):
        """Test that permissions have expected values."""
        assert Permission.READ.value == "read"
        assert Permission.WRITE.value == "write"
        assert Permission.EXECUTE.value == "execute"
        assert Permission.DELETE.value == "delete"
        assert Permission.ADMIN.value == "admin"

    def test_all_permissions_defined(self):
        """Test that all required permissions are defined."""
        perms = {
            Permission.READ,
            Permission.WRITE,
            Permission.EXECUTE,
            Permission.DELETE,
            Permission.ADMIN,
        }
        assert set(Permission) == perms


class TestRolePermissions:
    """Test RolePermissions class."""

    def test_admin_has_all_permissions(self):
        """Test that admin role has all permissions."""
        perms = RolePermissions.get_default_permissions(Role.ADMIN)
        assert Permission.READ in perms
        assert Permission.WRITE in perms
        assert Permission.EXECUTE in perms
        assert Permission.DELETE in perms
        assert Permission.ADMIN in perms

    def test_user_has_standard_permissions(self):
        """Test that user role has standard permissions."""
        perms = RolePermissions.get_default_permissions(Role.USER)
        assert Permission.READ in perms
        assert Permission.WRITE in perms
        assert Permission.EXECUTE in perms
        assert Permission.DELETE in perms
        assert Permission.ADMIN not in perms

    def test_guest_has_read_only(self):
        """Test that guest role has read-only permissions."""
        perms = RolePermissions.get_default_permissions(Role.GUEST)
        assert Permission.READ in perms
        assert Permission.WRITE not in perms
        assert Permission.EXECUTE not in perms
        assert Permission.DELETE not in perms
        assert Permission.ADMIN not in perms

    def test_has_permission(self):
        """Test checking if role has permission."""
        role_perms = RolePermissions(
            role=Role.USER,
            permissions=RolePermissions.get_default_permissions(Role.USER)
        )
        assert role_perms.has_permission(Permission.READ)
        assert role_perms.has_permission(Permission.WRITE)
        assert not role_perms.has_permission(Permission.ADMIN)

    def test_add_permission(self):
        """Test adding permission to role."""
        role_perms = RolePermissions(
            role=Role.USER,
            permissions=RolePermissions.get_default_permissions(Role.USER)
        )
        role_perms.add_permission(Permission.ADMIN)
        assert role_perms.has_permission(Permission.ADMIN)

    def test_remove_permission(self):
        """Test removing permission from role."""
        role_perms = RolePermissions(
            role=Role.USER,
            permissions=RolePermissions.get_default_permissions(Role.USER)
        )
        assert role_perms.remove_permission(Permission.DELETE)
        assert not role_perms.has_permission(Permission.DELETE)

    def test_remove_nonexistent_permission(self):
        """Test removing permission that doesn't exist."""
        role_perms = RolePermissions(
            role=Role.GUEST,
            permissions=RolePermissions.get_default_permissions(Role.GUEST)
        )
        assert not role_perms.remove_permission(Permission.ADMIN)


class TestUserRole:
    """Test UserRole class."""

    def test_user_role_creation(self):
        """Test creating a user role."""
        user_role = UserRole(user_id="user-123", role=Role.USER)
        assert user_role.user_id == "user-123"
        assert user_role.role == Role.USER
        assert user_role.granted_by is None
        assert len(user_role.custom_permissions) == 0

    def test_user_role_with_granted_by(self):
        """Test creating a user role with granted_by."""
        user_role = UserRole(
            user_id="user-123",
            role=Role.USER,
            granted_by="admin-1"
        )
        assert user_role.granted_by == "admin-1"

    def test_user_role_with_custom_permissions(self):
        """Test user role with custom permissions."""
        user_role = UserRole(
            user_id="user-123",
            role=Role.GUEST,
            custom_permissions={Permission.WRITE}
        )
        assert Permission.WRITE in user_role.get_all_permissions()

    def test_get_all_permissions(self):
        """Test getting all permissions."""
        user_role = UserRole(
            user_id="user-123",
            role=Role.USER,
            custom_permissions={Permission.ADMIN}
        )
        perms = user_role.get_all_permissions()
        # User has all standard permissions plus admin
        assert Permission.READ in perms
        assert Permission.ADMIN in perms

    def test_has_permission(self):
        """Test checking permission."""
        user_role = UserRole(user_id="user-123", role=Role.USER)
        assert user_role.has_permission(Permission.READ)
        assert not user_role.has_permission(Permission.ADMIN)

    def test_to_dict_and_from_dict(self):
        """Test serialization round-trip."""
        original = UserRole(
            user_id="user-123",
            role=Role.USER,
            granted_by="admin-1",
            custom_permissions={Permission.ADMIN}
        )
        data = original.to_dict()
        restored = UserRole.from_dict(data)

        assert restored.user_id == original.user_id
        assert restored.role == original.role
        assert restored.granted_by == original.granted_by
        assert restored.custom_permissions == original.custom_permissions


class TestRBACManager:
    """Test RBACManager class."""

    def test_manager_creation(self):
        """Test creating a manager."""
        manager = RBACManager()
        assert len(manager) == 0

    def test_grant_role(self):
        """Test granting a role to a user."""
        manager = RBACManager()
        user_role = manager.grant_role("user-123", Role.USER)

        assert user_role.user_id == "user-123"
        assert user_role.role == Role.USER
        assert "user-123" in manager

    def test_grant_role_with_granted_by(self):
        """Test granting role with granted_by."""
        manager = RBACManager()
        user_role = manager.grant_role("user-123", Role.USER, granted_by="admin-1")

        assert user_role.granted_by == "admin-1"

    def test_grant_duplicate_role_raises_error(self):
        """Test that granting same role twice raises error."""
        manager = RBACManager()
        manager.grant_role("user-123", Role.USER)

        with pytest.raises(ValueError, match="already has role"):
            manager.grant_role("user-123", Role.USER)

    def test_update_role(self):
        """Test updating a user's role."""
        manager = RBACManager()
        manager.grant_role("user-123", Role.USER)
        updated = manager.update_role("user-123", Role.ADMIN)

        assert updated.role == Role.ADMIN

    def test_update_nonexistent_role_raises_error(self):
        """Test that updating nonexistent user raises error."""
        manager = RBACManager()

        with pytest.raises(ValueError, match="has no role"):
            manager.update_role("user-123", Role.ADMIN)

    def test_revoke_role(self):
        """Test revoking a user's role."""
        manager = RBACManager()
        manager.grant_role("user-123", Role.USER)
        revoked = manager.revoke_role("user-123")

        assert revoked == Role.USER
        assert "user-123" not in manager

    def test_revoke_nonexistent_role(self):
        """Test revoking role from user without role."""
        manager = RBACManager()
        revoked = manager.revoke_role("user-123")

        assert revoked is None

    def test_get_user_role(self):
        """Test getting a user's role."""
        manager = RBACManager()
        manager.grant_role("user-123", Role.USER)

        assert manager.get_user_role("user-123") == Role.USER
        assert manager.get_user_role("nonexistent") is None

    def test_get_user_role_details(self):
        """Test getting detailed user role info."""
        manager = RBACManager()
        manager.grant_role("user-123", Role.USER, granted_by="admin-1")

        details = manager.get_user_role_details("user-123")
        assert details is not None
        assert details.granted_by == "admin-1"

    def test_check_permission_granted(self):
        """Test permission check when granted."""
        manager = RBACManager()
        manager.grant_role("user-123", Role.USER)

        check = manager.check_permission("user-123", Permission.READ)
        assert check.granted
        assert "granted" in check.reason.lower()

    def test_check_permission_denied(self):
        """Test permission check when denied."""
        manager = RBACManager()
        manager.grant_role("user-123", Role.GUEST)

        check = manager.check_permission("user-123", Permission.WRITE)
        assert not check.granted
        assert "lacks" in check.reason.lower() or "denied" in check.reason.lower()

    def test_check_permission_no_role(self):
        """Test permission check for user without role."""
        manager = RBACManager()

        check = manager.check_permission("user-123", Permission.READ)
        assert not check.granted
        assert "no assigned role" in check.reason

    def test_has_permission(self):
        """Test quick permission check."""
        manager = RBACManager()
        manager.grant_role("user-123", Role.USER)

        assert manager.has_permission("user-123", Permission.READ)
        assert not manager.has_permission("user-123", Permission.ADMIN)

    def test_add_custom_permission(self):
        """Test adding custom permission to user."""
        manager = RBACManager()
        manager.grant_role("user-123", Role.GUEST)

        result = manager.add_custom_permission("user-123", Permission.WRITE)
        assert result
        assert manager.has_permission("user-123", Permission.WRITE)

    def test_add_custom_permission_nonexistent_user(self):
        """Test adding custom permission to nonexistent user."""
        manager = RBACManager()

        result = manager.add_custom_permission("user-123", Permission.WRITE)
        assert not result

    def test_remove_custom_permission(self):
        """Test removing custom permission."""
        manager = RBACManager()
        manager.grant_role(
            "user-123",
            Role.GUEST,
            custom_permissions={Permission.WRITE}
        )

        result = manager.remove_custom_permission("user-123", Permission.WRITE)
        assert result
        assert not manager.has_permission("user-123", Permission.WRITE)

    def test_get_users_by_role(self):
        """Test getting users by role."""
        manager = RBACManager()
        manager.grant_role("user-1", Role.ADMIN)
        manager.grant_role("user-2", Role.USER)
        manager.grant_role("user-3", Role.USER)

        admins = manager.get_users_by_role(Role.ADMIN)
        assert "user-1" in admins
        assert "user-2" not in admins

        users = manager.get_users_by_role(Role.USER)
        assert "user-2" in users
        assert "user-3" in users

    def test_get_all_users(self):
        """Test getting all users."""
        manager = RBACManager()
        manager.grant_role("user-1", Role.ADMIN)
        manager.grant_role("user-2", Role.USER)

        all_users = manager.get_all_users()
        assert len(all_users) == 2
        assert all_users["user-1"] == Role.ADMIN
        assert all_users["user-2"] == Role.USER

    def test_get_all_permissions(self):
        """Test getting all permissions for user."""
        manager = RBACManager()
        manager.grant_role("user-123", Role.USER)

        perms = manager.get_all_permissions("user-123")
        assert Permission.READ in perms
        assert Permission.WRITE in perms
        assert Permission.ADMIN not in perms

    def test_to_dict_and_from_dict(self):
        """Test serialization round-trip."""
        original = RBACManager()
        original.grant_role("user-1", Role.ADMIN)
        original.grant_role("user-2", Role.USER)

        data = original.to_dict()
        restored = RBACManager.from_dict(data)

        assert len(restored) == len(original)
        assert restored.get_user_role("user-1") == Role.ADMIN
        assert restored.get_user_role("user-2") == Role.USER

    def test_clear(self):
        """Test clearing all roles."""
        manager = RBACManager()
        manager.grant_role("user-1", Role.ADMIN)
        manager.grant_role("user-2", Role.USER)

        manager.clear()
        assert len(manager) == 0

    def test_persistence(self):
        """Test persistence to file."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            path = Path(f.name)

        try:
            # Create and populate
            manager = RBACManager(persistence_path=path)
            manager.grant_role("user-1", Role.ADMIN)
            manager.grant_role("user-2", Role.USER)

            # Load fresh
            manager2 = RBACManager(persistence_path=path)
            assert manager2.get_user_role("user-1") == Role.ADMIN
            assert manager2.get_user_role("user-2") == Role.USER
        finally:
            path.unlink(missing_ok=True)

    def test_hooks(self):
        """Test hook callbacks."""
        manager = RBACManager()
        hook_calls = []

        def pre_grant_hook(user_id, role, granted_by):
            hook_calls.append(("pre_grant", user_id, role))

        def post_grant_hook(user_role):
            hook_calls.append(("post_grant", user_role.user_id))

        manager.add_hook("pre_grant", pre_grant_hook)
        manager.add_hook("post_grant", post_grant_hook)

        manager.grant_role("user-123", Role.USER)

        assert ("pre_grant", "user-123", Role.USER) in hook_calls
        assert ("post_grant", "user-123") in hook_calls

    def test_remove_hook(self):
        """Test removing hook callback."""
        manager = RBACManager()
        hook_calls = []

        def hook(user_id, role, granted_by):
            hook_calls.append(1)

        manager.add_hook("pre_grant", hook)
        manager.grant_role("user-1", Role.USER)
        assert len(hook_calls) == 1

        manager.remove_hook("pre_grant", hook)
        manager.grant_role("user-2", Role.USER)
        assert len(hook_calls) == 1  # No new calls


class TestRequirePermissionDecorator:
    """Test the @require_permission decorator."""

    def test_grants_access(self):
        """Test decorator allows access when user has permission."""
        manager = RBACManager()
        manager.grant_role("user-123", Role.USER)

        @require_permission(Permission.READ, manager)
        def read_file(user_id, path):
            return f"Reading {path} for {user_id}"

        result = read_file("user-123", "/data/file.txt")
        assert result == "Reading /data/file.txt for user-123"

    def test_denies_access(self):
        """Test decorator denies access when user lacks permission."""
        manager = RBACManager()
        manager.grant_role("user-123", Role.GUEST)

        @require_permission(Permission.WRITE, manager)
        def write_file(user_id, path, content):
            return f"Writing to {path}"

        with pytest.raises(PermissionError):
            write_file("user-123", "/data/file.txt", "content")

    def test_no_user_id_param_raises_error(self):
        """Test that missing user_id parameter raises error."""
        manager = RBACManager()

        @require_permission(Permission.READ, manager)
        def read_file(path):
            return path

        with pytest.raises(ValueError, match="user_id"):
            read_file("/data/file.txt")

    def test_custom_user_id_param(self):
        """Test decorator with custom user_id parameter name."""
        manager = RBACManager()
        manager.grant_role("user-123", Role.USER)

        @require_permission(Permission.READ, manager, user_id_param="operator")
        def read_file(operator, path):
            return f"Reading {path} for {operator}"

        result = read_file("user-123", "/data/file.txt")
        assert "user-123" in result


# =============================================================================
# ACL Tests
# =============================================================================

class TestACLEntry:
    """Test ACLEntry class."""

    def test_create_user_entry(self):
        """Test creating a user-specific entry."""
        entry = ACLEntry(user_id="user-123", permissions={Permission.READ})
        assert entry.user_id == "user-123"
        assert entry.target_type == "user"
        assert entry.target_id == "user-123"
        assert Permission.READ in entry.permissions

    def test_create_group_entry(self):
        """Test creating a group-specific entry."""
        entry = ACLEntry(group_id="developers", permissions={Permission.READ, Permission.WRITE})
        assert entry.group_id == "developers"
        assert entry.target_type == "group"
        assert entry.target_id == "developers"

    def test_create_role_entry(self):
        """Test creating a role-based entry."""
        entry = ACLEntry(role=Role.USER, permissions={Permission.READ})
        assert entry.role == Role.USER
        assert entry.target_type == "role"
        assert entry.target_id == "user"

    def test_entry_without_target_raises_error(self):
        """Test that entry without target raises error."""
        with pytest.raises(ValueError, match="must specify"):
            ACLEntry(permissions={Permission.READ})

    def test_entry_with_multiple_targets_raises_error(self):
        """Test that entry with multiple targets raises error."""
        with pytest.raises(ValueError, match="can only specify one"):
            ACLEntry(user_id="user-123", group_id="developers", permissions={Permission.READ})

    def test_matches_user(self):
        """Test matching user."""
        entry = ACLEntry(user_id="user-123", permissions={Permission.READ})
        assert entry.matches_user("user-123")
        assert not entry.matches_user("user-456")

    def test_matches_group(self):
        """Test matching group."""
        entry = ACLEntry(group_id="developers", permissions={Permission.READ})
        assert entry.matches_user("user-123", groups={"developers", "admins"})
        assert not entry.matches_user("user-123", groups={"admins"})
        assert not entry.matches_user("user-123")

    def test_matches_role(self):
        """Test matching role."""
        entry = ACLEntry(role=Role.USER, permissions={Permission.READ})
        assert entry.matches_user("user-123", role=Role.USER)
        assert not entry.matches_user("user-123", role=Role.GUEST)

    def test_has_permission(self):
        """Test checking permission."""
        entry = ACLEntry(user_id="user-123", permissions={Permission.READ, Permission.WRITE})
        assert entry.has_permission(Permission.READ)
        assert entry.has_permission(Permission.WRITE)
        assert not entry.has_permission(Permission.DELETE)

    def test_add_permission(self):
        """Test adding permission."""
        entry = ACLEntry(user_id="user-123", permissions={Permission.READ})
        entry.add_permission(Permission.WRITE)
        assert entry.has_permission(Permission.WRITE)

    def test_remove_permission(self):
        """Test removing permission."""
        entry = ACLEntry(user_id="user-123", permissions={Permission.READ, Permission.WRITE})
        assert entry.remove_permission(Permission.WRITE)
        assert not entry.has_permission(Permission.WRITE)

    def test_inherit_flag(self):
        """Test inherit flag."""
        entry = ACLEntry(user_id="user-123", permissions={Permission.READ}, inherit=True)
        assert entry.inherit

        entry2 = ACLEntry(user_id="user-456", permissions={Permission.READ}, inherit=False)
        assert not entry2.inherit

    def test_to_dict_and_from_dict(self):
        """Test serialization round-trip."""
        original = ACLEntry(user_id="user-123", permissions={Permission.READ, Permission.WRITE}, inherit=False)
        data = original.to_dict()
        restored = ACLEntry.from_dict(data)

        assert restored.user_id == original.user_id
        assert restored.permissions == original.permissions
        assert restored.inherit == original.inherit

    def test_str_representation(self):
        """Test string representation."""
        entry = ACLEntry(user_id="user-123", permissions={Permission.READ, Permission.WRITE})
        s = str(entry)
        assert "user:user-123" in s
        assert "read" in s or "write" in s

    def test_hash_and_equality(self):
        """Test hash and equality."""
        entry1 = ACLEntry(user_id="user-123", permissions={Permission.READ})
        entry2 = ACLEntry(user_id="user-123", permissions={Permission.WRITE})
        entry3 = ACLEntry(user_id="user-456", permissions={Permission.READ})

        assert entry1 == entry2  # Same target
        assert entry1 != entry3  # Different target
        assert hash(entry1) == hash(entry2)


class TestAccessControlList:
    """Test AccessControlList class."""

    def test_acl_creation(self):
        """Test creating an ACL."""
        acl = AccessControlList(path="/data/secret")
        assert acl.path == "/data/secret"
        assert len(acl) == 0
        assert not acl.is_directory

    def test_acl_for_directory(self):
        """Test creating ACL for directory."""
        acl = AccessControlList(path="/data", is_directory=True)
        assert acl.is_directory

    def test_add_entry(self):
        """Test adding an entry."""
        acl = AccessControlList(path="/data/secret")
        entry = ACLEntry(user_id="user-123", permissions={Permission.READ})
        acl.add_entry(entry)

        assert len(acl) == 1
        assert entry in acl

    def test_add_replaces_existing(self):
        """Test that adding replaces existing entry for same target."""
        acl = AccessControlList(path="/data/secret")
        acl.add_entry(ACLEntry(user_id="user-123", permissions={Permission.READ}))
        acl.add_entry(ACLEntry(user_id="user-123", permissions={Permission.WRITE}))

        assert len(acl) == 1
        assert acl.check_access("user-123", Permission.WRITE)

    def test_remove_entry(self):
        """Test removing an entry."""
        acl = AccessControlList(path="/data/secret")
        acl.add_entry(ACLEntry(user_id="user-123", permissions={Permission.READ}))

        result = acl.remove_entry(user_id="user-123")
        assert result
        assert len(acl) == 0

    def test_remove_nonexistent_entry(self):
        """Test removing nonexistent entry."""
        acl = AccessControlList(path="/data/secret")
        result = acl.remove_entry(user_id="user-123")
        assert not result

    def test_get_entry(self):
        """Test getting a specific entry."""
        acl = AccessControlList(path="/data/secret")
        acl.add_entry(ACLEntry(user_id="user-123", permissions={Permission.READ}))

        entry = acl.get_entry(user_id="user-123")
        assert entry is not None
        assert entry.user_id == "user-123"

        assert acl.get_entry(user_id="user-456") is None

    def test_get_entries_for_user(self):
        """Test getting all entries for a user."""
        acl = AccessControlList(path="/data/secret")
        acl.add_entry(ACLEntry(user_id="user-123", permissions={Permission.READ}))
        acl.add_entry(ACLEntry(group_id="developers", permissions={Permission.WRITE}))
        acl.add_entry(ACLEntry(role=Role.USER, permissions={Permission.EXECUTE}))

        entries = acl.get_entries_for_user("user-123", groups={"developers"}, role=Role.USER)
        assert len(entries) == 3  # User, group, and role entries match

    def test_check_access(self):
        """Test checking access."""
        acl = AccessControlList(path="/data/secret")
        acl.add_entry(ACLEntry(user_id="user-123", permissions={Permission.READ, Permission.WRITE}))

        assert acl.check_access("user-123", Permission.READ)
        assert acl.check_access("user-123", Permission.WRITE)
        assert not acl.check_access("user-123", Permission.DELETE)
        assert not acl.check_access("user-456", Permission.READ)

    def test_check_access_with_groups(self):
        """Test checking access with groups."""
        acl = AccessControlList(path="/data/secret")
        acl.add_entry(ACLEntry(group_id="developers", permissions={Permission.READ, Permission.WRITE}))

        assert acl.check_access("user-123", Permission.READ, groups={"developers"})
        assert not acl.check_access("user-123", Permission.READ, groups={"admins"})

    def test_check_access_with_role(self):
        """Test checking access with role."""
        acl = AccessControlList(path="/data/secret")
        acl.add_entry(ACLEntry(role=Role.USER, permissions={Permission.READ}))

        assert acl.check_access("user-123", Permission.READ, role=Role.USER)
        assert not acl.check_access("user-123", Permission.READ, role=Role.GUEST)

    def test_get_permissions(self):
        """Test getting all permissions for user."""
        acl = AccessControlList(path="/data/secret")
        acl.add_entry(ACLEntry(user_id="user-123", permissions={Permission.READ}))
        acl.add_entry(ACLEntry(group_id="developers", permissions={Permission.WRITE}))

        perms = acl.get_permissions("user-123", groups={"developers"})
        assert Permission.READ in perms
        assert Permission.WRITE in perms

    def test_inherit_from(self):
        """Test inheriting from parent ACL."""
        parent = AccessControlList(path="/data", is_directory=True)
        parent.add_entry(ACLEntry(user_id="user-123", permissions={Permission.READ}, inherit=True))
        parent.add_entry(ACLEntry(user_id="admin-1", permissions={Permission.ADMIN}, inherit=False))

        child = AccessControlList(path="/data/secret", is_directory=False)
        child.inherit_from(parent)

        # Should inherit only entries with inherit=True
        assert child.check_access("user-123", Permission.READ)
        assert not child.check_access("admin-1", Permission.ADMIN)

    def test_inherit_directory_re_inherits(self):
        """Test that directories can re-inherit."""
        parent = AccessControlList(path="/data", is_directory=True)
        parent.add_entry(ACLEntry(user_id="user-123", permissions={Permission.READ}, inherit=True))

        child = AccessControlList(path="/data/child", is_directory=True)
        child.inherit_from(parent)

        # Child directory should have inherit=True for inherited entries
        entry = child.get_entry(user_id="user-123")
        assert entry.inherit

    def test_inherit_file_no_re_inherit(self):
        """Test that files cannot re-inherit."""
        parent = AccessControlList(path="/data", is_directory=True)
        parent.add_entry(ACLEntry(user_id="user-123", permissions={Permission.READ}, inherit=True))

        child = AccessControlList(path="/data/file.txt", is_directory=False)
        child.inherit_from(parent)

        # Child file should have inherit=False
        entry = child.get_entry(user_id="user-123")
        assert not entry.inherit

    def test_to_dict_and_from_dict(self):
        """Test serialization round-trip."""
        original = AccessControlList(path="/data/secret", is_directory=False)
        original.add_entry(ACLEntry(user_id="user-123", permissions={Permission.READ}))

        data = original.to_dict()
        restored = AccessControlList.from_dict(data)

        assert restored.path == original.path
        assert restored.is_directory == original.is_directory
        assert len(restored) == len(original)

    def test_str_representation(self):
        """Test string representation."""
        acl = AccessControlList(path="/data/secret")
        acl.add_entry(ACLEntry(user_id="user-123", permissions={Permission.READ}))
        s = str(acl)
        assert "/data/secret" in s
        assert "user:user-123" in s


class TestACLManager:
    """Test ACLManager class."""

    def test_manager_creation(self):
        """Test creating a manager."""
        manager = ACLManager()
        assert len(manager) == 0

    def test_create_acl(self):
        """Test creating an ACL."""
        manager = ACLManager()
        acl = manager.create_acl("/data/secret")

        assert acl.path == "/data/secret"
        assert "/data/secret" in manager

    def test_create_acl_for_directory(self):
        """Test creating ACL for directory."""
        manager = ACLManager()
        acl = manager.create_acl("/data", is_directory=True)

        assert acl.is_directory

    def test_create_duplicate_acl_raises_error(self):
        """Test that creating duplicate ACL raises error."""
        manager = ACLManager()
        manager.create_acl("/data/secret")

        with pytest.raises(ValueError, match="already exists"):
            manager.create_acl("/data/secret")

    def test_create_acl_with_inheritance(self):
        """Test creating ACL with inheritance."""
        manager = ACLManager()
        parent = manager.create_acl("/data", is_directory=True)
        parent.add_entry(ACLEntry(user_id="user-123", permissions={Permission.READ}))

        child = manager.create_acl("/data/secret", inherit_from="/data")
        assert child.check_access("user-123", Permission.READ)

    def test_get_acl(self):
        """Test getting an ACL."""
        manager = ACLManager()
        manager.create_acl("/data/secret")

        acl = manager.get_acl("/data/secret")
        assert acl is not None
        assert acl.path == "/data/secret"

        assert manager.get_acl("/nonexistent") is None

    def test_get_or_create_acl(self):
        """Test get or create ACL."""
        manager = ACLManager()

        # Creates new
        acl1 = manager.get_or_create_acl("/data/secret")
        assert acl1.path == "/data/secret"

        # Returns existing
        acl2 = manager.get_or_create_acl("/data/secret")
        assert acl2 is acl1

    def test_delete_acl(self):
        """Test deleting an ACL."""
        manager = ACLManager()
        manager.create_acl("/data/secret")

        result = manager.delete_acl("/data/secret")
        assert result
        assert "/data/secret" not in manager

    def test_delete_nonexistent_acl(self):
        """Test deleting nonexistent ACL."""
        manager = ACLManager()
        result = manager.delete_acl("/nonexistent")
        assert not result

    def test_check_access(self):
        """Test checking access through manager."""
        manager = ACLManager()
        acl = manager.create_acl("/data/secret")
        acl.add_entry(ACLEntry(user_id="user-123", permissions={Permission.READ}))

        assert manager.check_access("/data/secret", "user-123", Permission.READ)
        assert not manager.check_access("/data/secret", "user-456", Permission.READ)

    def test_check_access_with_groups_and_role(self):
        """Test checking access with groups and role."""
        manager = ACLManager()
        acl = manager.create_acl("/data/secret")
        acl.add_entry(ACLEntry(group_id="developers", permissions={Permission.READ}))

        assert manager.check_access(
            "/data/secret",
            "user-123",
            Permission.READ,
            groups={"developers"}
        )

    def test_check_access_inheritance(self):
        """Test that access check looks at parent paths."""
        manager = ACLManager()
        parent = manager.create_acl("/data", is_directory=True)
        parent.add_entry(ACLEntry(user_id="user-123", permissions={Permission.READ}))

        # Child doesn't have its own ACL
        assert manager.check_access("/data/secret", "user-123", Permission.READ)

    def test_get_permissions(self):
        """Test getting permissions."""
        manager = ACLManager()
        acl = manager.create_acl("/data/secret")
        acl.add_entry(ACLEntry(user_id="user-123", permissions={Permission.READ, Permission.WRITE}))

        perms = manager.get_permissions("/data/secret", "user-123")
        assert Permission.READ in perms
        assert Permission.WRITE in perms

    def test_add_entry(self):
        """Test adding entry through manager."""
        manager = ACLManager()
        manager.create_acl("/data/secret")

        entry = ACLEntry(user_id="user-123", permissions={Permission.READ})
        acl = manager.add_entry("/data/secret", entry)

        assert acl.check_access("user-123", Permission.READ)

    def test_add_entry_creates_acl(self):
        """Test that adding entry creates ACL if missing."""
        manager = ACLManager()
        entry = ACLEntry(user_id="user-123", permissions={Permission.READ})

        acl = manager.add_entry("/data/secret", entry, create_if_missing=True)
        assert "/data/secret" in manager

    def test_add_entry_no_create_raises_error(self):
        """Test that adding entry without create raises error."""
        manager = ACLManager()
        entry = ACLEntry(user_id="user-123", permissions={Permission.READ})

        with pytest.raises(ValueError, match="No ACL found"):
            manager.add_entry("/data/secret", entry, create_if_missing=False)

    def test_remove_entry(self):
        """Test removing entry through manager."""
        manager = ACLManager()
        acl = manager.create_acl("/data/secret")
        acl.add_entry(ACLEntry(user_id="user-123", permissions={Permission.READ}))

        result = manager.remove_entry("/data/secret", user_id="user-123")
        assert result
        assert not manager.check_access("/data/secret", "user-123", Permission.READ)

    def test_list_acls(self):
        """Test listing all ACLs."""
        manager = ACLManager()
        manager.create_acl("/data/secret1")
        manager.create_acl("/data/secret2")

        paths = manager.list_acls()
        assert len(paths) == 2
        assert "/data/secret1" in paths
        assert "/data/secret2" in paths

    def test_get_stats(self):
        """Test getting statistics."""
        manager = ACLManager()
        manager.create_acl("/data", is_directory=True)
        manager.create_acl("/data/secret")

        stats = manager.get_stats()
        assert stats["total_acls"] == 2
        assert stats["directory_acls"] == 1
        assert stats["file_acls"] == 1

    def test_to_dict_and_from_dict(self):
        """Test serialization round-trip."""
        original = ACLManager()
        acl1 = original.create_acl("/data", is_directory=True)
        acl1.add_entry(ACLEntry(user_id="user-123", permissions={Permission.READ}))

        data = original.to_dict()
        restored = ACLManager.from_dict(data)

        assert len(restored) == len(original)
        assert restored.check_access("/data", "user-123", Permission.READ)

    def test_clear(self):
        """Test clearing all ACLs."""
        manager = ACLManager()
        manager.create_acl("/data/secret1")
        manager.create_acl("/data/secret2")

        manager.clear()
        assert len(manager) == 0

    def test_persistence(self):
        """Test persistence to file."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            path = Path(f.name)

        try:
            # Create and populate - use manager.add_entry for persistence
            manager = ACLManager(persistence_path=path)
            manager.create_acl("/data/secret")
            manager.add_entry("/data/secret", ACLEntry(user_id="user-123", permissions={Permission.READ}))

            # Load fresh
            manager2 = ACLManager(persistence_path=path)
            assert manager2.check_access("/data/secret", "user-123", Permission.READ)
        finally:
            path.unlink(missing_ok=True)

    def test_hooks(self):
        """Test hook callbacks."""
        manager = ACLManager()
        hook_calls = []

        def pre_create_hook(path, is_directory):
            hook_calls.append(("pre_create", path))

        def post_create_hook(acl):
            hook_calls.append(("post_create", acl.path))

        manager.add_hook("pre_create", pre_create_hook)
        manager.add_hook("post_create", post_create_hook)

        manager.create_acl("/data/secret")

        assert ("pre_create", "/data/secret") in hook_calls
        assert ("post_create", "/data/secret") in hook_calls

    def test_path_normalization(self):
        """Test path normalization."""
        manager = ACLManager()
        manager.create_acl("/data/secret/")

        # Should work with or without trailing slash
        assert "/data/secret" in manager
        assert manager.get_acl("/data/secret/") is not None


# =============================================================================
# Integration Tests
# =============================================================================

class TestRBACACLIntegration:
    """Test integration between RBAC and ACL."""

    def test_rbac_role_with_acl(self):
        """Test using RBAC role in ACL entry."""
        manager = ACLManager()
        acl = manager.create_acl("/data/secret")

        # Grant read to all users with USER role
        acl.add_entry(ACLEntry(role=Role.USER, permissions={Permission.READ}))

        # User with USER role should have access
        assert manager.check_access("/data/secret", "user-123", Permission.READ, role=Role.USER)

        # User with GUEST role should not
        assert not manager.check_access("/data/secret", "user-123", Permission.READ, role=Role.GUEST)

    def test_combined_permissions(self):
        """Test combining role-based and user-specific permissions."""
        manager = ACLManager()
        acl = manager.create_acl("/data/secret")

        # Role-based permission
        acl.add_entry(ACLEntry(role=Role.USER, permissions={Permission.READ}))

        # User-specific additional permission
        acl.add_entry(ACLEntry(user_id="user-123", permissions={Permission.WRITE}))

        perms = manager.get_permissions("/data/secret", "user-123", role=Role.USER)
        assert Permission.READ in perms  # From role
        assert Permission.WRITE in perms  # From user entry

    def test_permission_priority(self):
        """Test that user-specific permissions override role permissions."""
        manager = ACLManager()
        acl = manager.create_acl("/data/secret")

        # Role-based: read only
        acl.add_entry(ACLEntry(role=Role.GUEST, permissions={Permission.READ}))

        # User-specific: read and write
        acl.add_entry(ACLEntry(user_id="user-123", permissions={Permission.READ, Permission.WRITE}))

        # User has GUEST role but also has specific entry
        perms = manager.get_permissions("/data/secret", "user-123", role=Role.GUEST)
        assert Permission.READ in perms
        assert Permission.WRITE in perms  # From user entry, not role


class TestEdgeCases:
    """Test edge cases and error handling."""

    def test_empty_acl(self):
        """Test ACL with no entries."""
        acl = AccessControlList(path="/data/secret")
        assert not acl.check_access("user-123", Permission.READ)

    def test_empty_permissions(self):
        """Test ACL entry with no permissions."""
        entry = ACLEntry(user_id="user-123", permissions=set())
        assert not entry.has_permission(Permission.READ)

    def test_manager_empty_path(self):
        """Test manager with root path."""
        manager = ACLManager()
        acl = manager.create_acl("/")
        assert acl.path == "/"

    def test_special_characters_in_path(self):
        """Test path with special characters."""
        manager = ACLManager()
        acl = manager.create_acl("/data/file with spaces.txt")
        assert "/data/file with spaces.txt" in manager

    def test_deep_nesting(self):
        """Test deeply nested path."""
        manager = ACLManager()
        acl = manager.create_acl("/a/b/c/d/e/f/g/h")
        assert acl.path == "/a/b/c/d/e/f/g/h"

    def test_case_sensitivity(self):
        """Test that paths are case-sensitive."""
        manager = ACLManager()
        manager.create_acl("/data/Secret")

        assert "/data/Secret" in manager
        assert "/data/secret" not in manager

    def test_concurrent_access(self):
        """Test thread safety."""
        import threading

        manager = RBACManager()
        errors = []

        def grant_roles(start, count):
            try:
                for i in range(start, start + count):
                    manager.grant_role(f"user-{i}", Role.USER)
            except Exception as e:
                errors.append(e)

        threads = [
            threading.Thread(target=grant_roles, args=(i * 100, 100))
            for i in range(4)
        ]

        for t in threads:
            t.start()
        for t in threads:
            t.join()

        assert len(errors) == 0
        assert len(manager) == 400


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
