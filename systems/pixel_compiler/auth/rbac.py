"""
Role-Based Access Control (RBAC) Engine.

This module provides:
- Role dataclass: Represents a role with permissions
- User dataclass: Represents a user with roles and direct permissions
- RBACEngine: Core engine for managing roles, users, and checking permissions
- require_permission: Decorator for protecting functions with permission checks
"""

from dataclasses import dataclass, field
from typing import List, Set, Optional, Dict, Callable, Any
from functools import wraps
import inspect

from .permissions import (
    Resource,
    Action,
    Permission,
    ROLE_DEFINITIONS,
)


@dataclass
class Role:
    """
    Represents a role with a set of permissions.

    Attributes:
        name: Unique name for this role
        description: Human-readable description of the role
        permissions: List of Permission objects granted by this role
        is_system: True if this is a predefined system role (cannot be modified/deleted)
    """

    name: str
    description: str
    permissions: List[Permission] = field(default_factory=list)
    is_system: bool = False

    def has_permission(self, resource: Resource, action: Action) -> bool:
        """
        Check if this role has a specific permission.

        Args:
            resource: The Resource to check
            action: The Action to check

        Returns:
            True if the role has the permission
        """
        for perm in self.permissions:
            # Check for wildcard permissions
            if perm.resource == Resource.FILES and perm.actions == set(Action):
                # This is a "*:*:*" wildcard
                return True

            if perm.resource == resource and action in perm.actions:
                return True
        return False

    @classmethod
    def from_definition(cls, name: str, permission_strs: List[str]) -> "Role":
        """
        Create a Role from a list of permission strings.

        Args:
            name: Role name
            permission_strs: List of permission strings to parse

        Returns:
            A Role object with parsed permissions
        """
        permissions = [Permission.from_string(p) for p in permission_strs]
        return cls(
            name=name,
            description=f"System role: {name}",
            permissions=permissions,
            is_system=True,
        )


@dataclass
class User:
    """
    Represents a user with roles and direct permissions.

    Attributes:
        id: Unique user identifier
        username: Unique username
        email: User email address
        roles: List of role names assigned to this user
        direct_permissions: List of Permission objects directly assigned (not from roles)
        enabled: True if the user account is enabled
    """

    id: str
    username: str
    email: str
    roles: List[str] = field(default_factory=list)
    direct_permissions: List[Permission] = field(default_factory=list)
    enabled: bool = True


class RBACEngine:
    """
    Core Role-Based Access Control engine.

    Manages roles, users, and permission checking. Provides methods for:
    - Creating and managing custom roles
    - Creating and managing users
    - Checking permissions
    - Getting user permissions
    """

    def __init__(self) -> None:
        """Initialize the RBAC engine with system roles loaded."""
        self._roles: Dict[str, Role] = {}
        self._users: Dict[str, User] = {}
        self._load_system_roles()

    def _load_system_roles(self) -> None:
        """Load predefined system roles from ROLE_DEFINITIONS."""
        for name, perm_strs in ROLE_DEFINITIONS.items():
            self._roles[name] = Role.from_definition(name, perm_strs)

    def get_all_roles(self) -> List[Role]:
        """
        Get all roles (system and custom).

        Returns:
            List of all Role objects
        """
        return list(self._roles.values())

    def get_role(self, name: str) -> Optional[Role]:
        """
        Get a role by name.

        Args:
            name: The role name

        Returns:
            The Role object or None if not found
        """
        return self._roles.get(name)

    def create_role(
        self,
        name: str,
        description: str,
        permissions: List[Permission],
    ) -> Role:
        """
        Create a new custom role.

        Args:
            name: Unique role name
            description: Human-readable description
            permissions: List of Permission objects for this role

        Returns:
            The created Role object

        Raises:
            ValueError: If a role with this name already exists
        """
        if name in self._roles:
            raise ValueError(f"Role '{name}' already exists")

        role = Role(
            name=name,
            description=description,
            permissions=permissions,
            is_system=False,
        )
        self._roles[name] = role
        return role

    def update_role(self, name: str, permissions: List[Permission]) -> Role:
        """
        Update a custom role's permissions.

        Args:
            name: The role name
            permissions: New list of Permission objects

        Returns:
            The updated Role object

        Raises:
            ValueError: If the role is a system role or doesn't exist
        """
        role = self._roles.get(name)
        if not role:
            raise ValueError(f"Role '{name}' does not exist")
        if role.is_system:
            raise ValueError(f"Cannot modify system role '{name}'")

        # Create a new Role with updated permissions
        # (Role is frozen, so we need to create a new instance)
        updated = Role(
            name=role.name,
            description=role.description,
            permissions=permissions,
            is_system=role.is_system,
        )
        self._roles[name] = updated
        return updated

    def delete_role(self, name: str) -> None:
        """
        Delete a custom role.

        Args:
            name: The role name

        Raises:
            ValueError: If the role is a system role or doesn't exist
        """
        role = self._roles.get(name)
        if not role:
            raise ValueError(f"Role '{name}' does not exist")
        if role.is_system:
            raise ValueError(f"Cannot delete system role '{name}'")

        del self._roles[name]

    def create_user(
        self,
        user_id: str,
        username: str,
        email: str,
        roles: Optional[List[str]] = None,
        direct_permissions: Optional[List[Permission]] = None,
        enabled: bool = True,
    ) -> User:
        """
        Create a new user.

        Args:
            user_id: Unique user identifier
            username: Unique username
            email: User email address
            roles: List of role names to assign
            direct_permissions: List of Permission objects directly assigned
            enabled: Whether the user is enabled

        Returns:
            The created User object

        Raises:
            ValueError: If a user with this ID already exists
        """
        if user_id in self._users:
            raise ValueError(f"User '{user_id}' already exists")

        user = User(
            id=user_id,
            username=username,
            email=email,
            roles=roles or [],
            direct_permissions=direct_permissions or [],
            enabled=enabled,
        )
        self._users[user_id] = user
        return user

    def get_user(self, user_id: str) -> Optional[User]:
        """
        Get a user by ID.

        Args:
            user_id: The user ID

        Returns:
            The User object or None if not found
        """
        return self._users.get(user_id)

    def add_role_to_user(self, user_id: str, role_name: str) -> None:
        """
        Add a role to a user.

        Args:
            user_id: The user ID
            role_name: The role name to add

        Raises:
            ValueError: If user or role doesn't exist, or user already has the role
        """
        user = self._users.get(user_id)
        if not user:
            raise ValueError(f"User '{user_id}' does not exist")
        if role_name not in self._roles:
            raise ValueError(f"Role '{role_name}' does not exist")
        if role_name in user.roles:
            raise ValueError(f"User already has role '{role_name}'")

        # User is frozen, so we need to create a new instance
        updated = User(
            id=user.id,
            username=user.username,
            email=user.email,
            roles=user.roles + [role_name],
            direct_permissions=user.direct_permissions,
            enabled=user.enabled,
        )
        self._users[user_id] = updated

    def remove_role_from_user(self, user_id: str, role_name: str) -> None:
        """
        Remove a role from a user.

        Args:
            user_id: The user ID
            role_name: The role name to remove

        Raises:
            ValueError: If user doesn't exist or doesn't have the role
        """
        user = self._users.get(user_id)
        if not user:
            raise ValueError(f"User '{user_id}' does not exist")
        if role_name not in user.roles:
            raise ValueError(f"User does not have role '{role_name}'")

        # Create new User instance without the role
        updated = User(
            id=user.id,
            username=user.username,
            email=user.email,
            roles=[r for r in user.roles if r != role_name],
            direct_permissions=user.direct_permissions,
            enabled=user.enabled,
        )
        self._users[user_id] = updated

    def check_permission(
        self,
        user_id: str,
        resource: Resource,
        action: Action,
        resource_id: Optional[str] = None,
    ) -> bool:
        """
        Check if a user has permission to perform an action on a resource.

        Args:
            user_id: The user ID
            resource: The Resource being accessed
            action: The Action being performed
            resource_id: Optional specific resource ID (e.g., "files:123")

        Returns:
            True if the user has permission, False otherwise
        """
        user = self._users.get(user_id)
        if not user:
            return False
        if not user.enabled:
            return False

        # Check all permissions from roles and direct assignments
        permissions = self.get_user_permissions(user_id)

        for perm in permissions:
            # Check for wildcard permission
            if perm.resource == Resource.FILES and perm.actions == set(Action):
                if perm.scope == "*:*:*" or not resource_id or perm.matches_scope(resource_id):
                    return True

            # Check resource and action match
            if perm.resource == resource and action in perm.actions:
                # If no resource_id specified, or scope matches
                if not resource_id or perm.matches_scope(resource_id):
                    return True

        return False

    def get_user_permissions(self, user_id: str) -> List[Permission]:
        """
        Get all permissions for a user (from roles and direct permissions).

        Args:
            user_id: The user ID

        Returns:
            List of all Permission objects the user has
        """
        user = self._users.get(user_id)
        if not user:
            return []

        permissions: List[Permission] = []

        # Add permissions from roles
        for role_name in user.roles:
            role = self._roles.get(role_name)
            if role:
                permissions.extend(role.permissions)

        # Add direct permissions
        permissions.extend(user.direct_permissions)

        return permissions


def require_permission(
    resource: Resource,
    action: Action,
    engine: RBACEngine,
    resource_id_param: Optional[str] = None,
    user_id_param: str = "user_id",
) -> Callable:
    """
    Decorator to protect a function with a permission check.

    Args:
        resource: The Resource being accessed
        action: The Action being performed
        engine: The RBACEngine instance to use for checking
        resource_id_param: Optional parameter name for the resource ID
        user_id_param: Parameter name for the user ID (default: "user_id")

    Raises:
        PermissionError: If the user lacks the required permission

    Example:
        @require_permission(Resource.FILES, Action.READ, engine)
        def read_files(user_id):
            return get_files()

        @require_permission(
            Resource.FILES,
            Action.DELETE,
            engine,
            resource_id_param="file_id"
        )
        def delete_file(user_id, file_id):
            return delete(file_id)
    """

    def decorator(func: Callable) -> Callable:
        @wraps(func)
        def wrapper(*args, **kwargs) -> Any:
            # Get user_id from function arguments
            sig = inspect.signature(func)
            bound_args = sig.bind(*args, **kwargs)
            bound_args.apply_defaults()

            user_id = bound_args.arguments.get(user_id_param)
            if not user_id:
                raise ValueError(
                    f"Function must have a '{user_id_param}' parameter for authorization"
                )

            # Get resource_id if specified
            resource_id = None
            if resource_id_param:
                resource_id = bound_args.arguments.get(resource_id_param)

            # Check permission
            if not engine.check_permission(user_id, resource, action, resource_id):
                raise PermissionError(
                    f"User '{user_id}' lacks permission '{action}' on resource '{resource}'"
                )

            return func(*args, **kwargs)

        return wrapper

    return decorator
