"""
Permission definitions and role-based access control (RBAC) core module.

This module defines:
- Resource enum: All resources in the system that can be accessed
- Action enum: All possible actions on resources
- Permission dataclass: Represents a permission with resource, actions, and scope
- ROLE_DEFINITIONS: Predefined system roles with their permissions
"""

from enum import Enum
from dataclasses import dataclass, field
from typing import Set, List, Dict
import fnmatch


class Resource(str, Enum):
    """All resources in the PixelRTS system that can be accessed."""

    FILES = "files"
    CONVERSION = "conversion"
    BENCHMARKS = "benchmarks"
    DASHBOARD = "dashboard"
    USERS = "users"
    ROLES = "roles"
    SETTINGS = "settings"
    API_KEYS = "api_keys"
    AUDIT_LOGS = "audit_logs"


class Action(str, Enum):
    """All possible actions on resources."""

    CREATE = "create"
    READ = "read"
    UPDATE = "update"
    DELETE = "delete"
    EXECUTE = "execute"
    ADMIN = "admin"


@dataclass(frozen=True)
class Permission:
    """
    Represents a permission with resource, actions, and scope.

    Attributes:
        resource: The Resource this permission applies to
        actions: Set of Action values allowed by this permission
        scope: String pattern matching resource IDs (e.g., "files:*", "files:123")

    The scope uses fnmatch pattern matching:
    - "*" matches any characters
    - "files:*" matches all files
    - "files:123" matches only file with ID 123
    - "files:temp-*" matches files starting with "temp-"
    """

    resource: Resource
    actions: Set[Action] = field(default_factory=set)
    scope: str = ""

    def matches_scope(self, resource_id: str) -> bool:
        """
        Check if this permission's scope matches the given resource ID.

        Args:
            resource_id: The resource ID to check (e.g., "files:123")

        Returns:
            True if the scope matches the resource ID
        """
        return fnmatch.fnmatch(resource_id, self.scope)

    @classmethod
    def from_string(cls, perm_str: str) -> "Permission":
        """
        Parse a permission string into a Permission object.

        Format: "resource:action[:scope]"
        - resource: One of the Resource enum values
        - action: Comma-separated actions, or "*" for all actions
        - scope: (optional) Resource scope pattern (e.g., "*", "files:*", "files:123")

        When scope is omitted, it defaults to "{resource}:*"

        Examples:
            - "files:read:files:*" -> Read any file
            - "files:read,write:files:*" -> Read and write any file
            - "files:*:*" -> All actions on any file (scope defaults to files:*)
            - "files:read" -> Read any file (scope defaults to files:*)
            - "*:*:*" -> All permissions (admin wildcard)

        Args:
            perm_str: The permission string to parse

        Returns:
            A Permission object

        Raises:
            ValueError: If the permission string is invalid
        """
        parts = perm_str.split(":")
        if len(parts) < 2:
            raise ValueError(
                f"Invalid permission format: '{perm_str}'. "
                "Expected format: 'resource:action[:scope]'"
            )

        resource_str = parts[0]
        action_str = parts[1]

        # Default scope to "{resource}:*" if not provided
        # The scope may contain colons, so join remaining parts
        if len(parts) < 3:
            scope = f"{resource_str}:*"
        elif len(parts) == 3 and parts[2] == "*":
            # If scope is just "*", expand to "resource:*" for consistency
            scope = f"{resource_str}:*"
        else:
            # Join all parts from index 2 onwards (scope may contain colons)
            scope = ":".join(parts[2:])

        # Handle wildcard resource
        if resource_str == "*":
            resource = Resource.FILES  # Placeholder, will be handled in checks
            actions = set(Action)
        else:
            try:
                resource = Resource(resource_str)
            except ValueError:
                raise ValueError(f"Invalid resource: '{resource_str}'")

            # Handle wildcard action
            if action_str == "*":
                actions = set(Action)
            else:
                action_names = action_str.split(",")
                actions = set()
                for name in action_names:
                    try:
                        actions.add(Action(name.strip()))
                    except ValueError:
                        raise ValueError(f"Invalid action: '{name}'")

        return cls(resource=resource, actions=actions, scope=scope)


# Predefined system role definitions
# Each role is a list of permission strings that will be parsed into Permission objects
ROLE_DEFINITIONS: Dict[str, List[str]] = {
    "viewer": [
        "files:read:files:*",
        "benchmarks:read:benchmarks:*",
        "dashboard:read:dashboard:*",
    ],
    "operator": [
        # Inherits viewer permissions
        "files:read:files:*",
        "benchmarks:read:benchmarks:*",
        "dashboard:read:dashboard:*",
        # Additional operator permissions
        "files:create:files:*",
        "files:execute:files:*",
        "benchmarks:create:benchmarks:*",
    ],
    "admin": [
        "*:*:*",  # Wildcard for all resources, actions, and scopes
    ],
    "auditor": [
        "files:read:files:*",
        "benchmarks:read:benchmarks:*",
        "audit_logs:read:audit_logs:*",
    ],
}
