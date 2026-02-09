#!/usr/bin/env python3
"""
PixelRTS v3 CLI with Authentication

This CLI adds authentication and authorization features to the PixelRTS v2 CLI.
Protected commands require users to login first.

Usage:
    pixelrts-v3 auth login -u <username>
    pixelrts-v3 auth logout
    pixelrts-v3 auth create-user -u <username> -e <email> -r <roles>
    pixelrts-v3 convert --protected <input> <output>
"""

import sys
import argparse
import getpass
from pathlib import Path
from typing import Optional

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent))

from auth.cli_auth import (
    AuthContext,
    get_auth_context,
    require_auth,
    _save_token_to_file,
    _load_token_from_file,
    _remove_token_file,
    prompt_for_password,
    prompt_for_username,
)

# Import convert command from pixelrts_cli.py
# We'll use the existing convert logic


def cmd_auth_login(args):
    """Handle auth login command."""
    ctx = get_auth_context()

    # Get username (from -u flag or prompt)
    username = None
    if hasattr(args, 'username') and args.username:
        username = args.username
    else:
        username = prompt_for_username()

    if not username:
        print("Error: Username is required", file=sys.stderr)
        return 1

    # Get password from prompt (no echo)
    password = prompt_for_password("Password: ")

    # Attempt login
    token = ctx.login(username, password)

    if token:
        _save_token_to_file(token)
        print(f"Successfully logged in as {username}")
        return 0
    else:
        print("Error: Invalid username or password", file=sys.stderr)
        return 1


def cmd_auth_logout(args):
    """Handle auth logout command."""
    token = _load_token_from_file()

    if not token:
        print("No active session found")
        return 0

    _remove_token_file()
    print("Successfully logged out")
    return 0


def cmd_auth_create_user(args):
    """Handle auth create-user command."""
    ctx = get_auth_context()

    # Check if current user is admin
    token = _load_token_from_file()
    if token:
        current_user = ctx.get_current_user(token)
        if current_user and "admin" not in current_user.get("roles", []):
            print("Error: Only admins can create users", file=sys.stderr)
            return 1

    # Get user details
    username = args.username
    if not username:
        print("Error: Username is required (-u)", file=sys.stderr)
        return 1

    email = args.email
    if not email:
        print("Error: Email is required (-e)", file=sys.stderr)
        return 1

    # Get password from prompt
    password = prompt_for_password("Password: ")
    if not password:
        print("Error: Password is required", file=sys.stderr)
        return 1

    confirm_password = prompt_for_password("Confirm password: ")
    if password != confirm_password:
        print("Error: Passwords do not match", file=sys.stderr)
        return 1

    # Get roles
    roles = args.roles if args.roles else ["operator"]
    # Parse comma-separated roles if provided as string
    if isinstance(roles, str):
        roles = [r.strip() for r in roles.split(",")]

    # Create user
    try:
        success = ctx.create_user(username, email, password, roles)
        if success:
            print(f"Successfully created user: {username}")
            print(f"  Email: {email}")
            print(f"  Roles: {', '.join(roles)}")
            return 0
        else:
            print(f"Error: User '{username}' already exists", file=sys.stderr)
            return 1
    except ValueError as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1


def cmd_auth_status(args):
    """Handle auth status command."""
    token = _load_token_from_file()

    if not token:
        print("Not logged in")
        return 0

    ctx = get_auth_context()
    user = ctx.get_current_user(token)

    if user:
        print(f"Logged in as: {user['username']}")
        print(f"Email: {user['email']}")
        print(f"Roles: {', '.join(user['roles'])}")
        return 0
    else:
        print("Invalid or expired session. Please login again.")
        _remove_token_file()
        return 1


def cmd_convert_protected(args):
    """Handle protected convert command (requires authentication)."""
    # Import the convert command from pixelrts_cli
    from pixelrts_cli import _convert_single_file

    # This function is wrapped with @require_auth
    # The user is passed as the first argument
    def protected_convert(user):
        """Internal convert function that receives authenticated user."""
        print(f"Executing protected convert as {user['username']}")

        # Call the original convert logic
        return _convert_single_file(args)

    # Run with authentication check
    try:
        return protected_convert(None)  # None will be replaced by @require_auth
    except TypeError:
        # If we're not being decorated, call directly
        # This shouldn't happen in normal use
        ctx = get_auth_context()
        token = _load_token_from_file()
        if not token:
            print("Error: Authentication required. Use 'pixelrts-v3 auth login' first", file=sys.stderr)
            return 1

        user = ctx.get_current_user(token)
        if not user:
            print("Error: Invalid or expired token. Use 'pixelrts-v3 auth login' first", file=sys.stderr)
            return 1

        return protected_convert(user)


def cmd_convert(args):
    """Handle convert command (with optional --protected flag)."""
    # Check if --protected flag is set
    if hasattr(args, 'protected') and args.protected:
        return cmd_convert_protected(args)

    # Otherwise, use the standard convert command
    from pixelrts_cli import cmd_convert as original_cmd_convert
    return original_cmd_convert(args)


def main():
    """Main CLI entry point."""
    parser = argparse.ArgumentParser(
        description='PixelRTS v3 - Binary Visualization Platform with Authentication',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Commands:
  convert      Convert binary files to .rts.png format
  auth         Authentication commands

Examples:
  pixelrts-v3 auth login -u myuser
  pixelrts-v3 auth logout
  pixelrts-v3 auth create-user -u newuser -e user@example.com -r operator
  pixelrts-v3 convert input.bin output.rts.png --protected
        """
    )

    subparsers = parser.add_subparsers(dest='command', help='Command to run')

    # Auth command group
    auth_parser = subparsers.add_parser('auth', help='Authentication commands')
    auth_subparsers = auth_parser.add_subparsers(dest='auth_command', help='Auth command')

    # auth login
    login_parser = auth_subparsers.add_parser('login', help='Login to PixelRTS')
    login_parser.add_argument('-u', '--username', help='Username')
    login_parser.add_argument('-p', '--password', help='Password (not recommended, use prompt)')

    # auth logout
    logout_parser = auth_subparsers.add_parser('logout', help='Logout from PixelRTS')

    # auth create-user
    create_user_parser = auth_subparsers.add_parser('create-user', help='Create a new user')
    create_user_parser.add_argument('-u', '--username', required=True, help='Username')
    create_user_parser.add_argument('-e', '--email', required=True, help='Email address')
    create_user_parser.add_argument('-r', '--roles', help='Comma-separated role names (default: operator)')
    create_user_parser.add_argument('-p', '--password', help='Password (not recommended, use prompt)')

    # auth status
    status_parser = auth_subparsers.add_parser('status', help='Show current authentication status')

    # Convert command (with --protected flag)
    convert_parser = subparsers.add_parser('convert', help='Convert binary files')
    convert_parser.add_argument('input', help='Input file or directory')
    convert_parser.add_argument('output', nargs='?', help='Output file or directory')
    convert_parser.add_argument('--protected', action='store_true',
                               help='Require authentication to convert')
    # Add all original converter args
    convert_parser.add_argument('--mode', choices=['standard', 'code'], default='standard')
    convert_parser.add_argument('--parallel', action='store_true',
                               help='Use parallel processing')
    convert_parser.add_argument('--workers', type=int,
                               help='Number of workers (default: CPU count)')
    convert_parser.add_argument('--recursive', '-r', action='store_true',
                               help='Process directories recursively')
    convert_parser.add_argument('--pattern', default='*',
                               help='File pattern to match (default: *)')
    convert_parser.add_argument('--mmap-threshold', type=int, default=100, metavar='MB',
                               help='File size threshold for memory mapping (default: 100 MB)')
    convert_parser.add_argument('--type', help='Content type')
    convert_parser.add_argument('--name', help='Content name')
    convert_parser.add_argument('--version', help='Content version')
    convert_parser.add_argument('--description', help='Content description')
    convert_parser.add_argument('--grid-size', type=int)
    convert_parser.add_argument('--generate-boot-script', action='store_true')
    convert_parser.add_argument('--qemu-arch', default='x86_64')
    convert_parser.add_argument('--qemu-memory', default='2G')
    convert_parser.add_argument('--qemu-cpu', default='host')
    convert_parser.add_argument('--kernel-cmdline')
    convert_parser.add_argument('-v', '--verbose', action='store_true')

    args = parser.parse_args()

    if not args.command:
        parser.print_help()
        return 1

    # Dispatch to command handler
    handlers = {
        'auth': cmd_auth,
        'convert': cmd_convert,
    }

    handler = handlers.get(args.command)
    if handler:
        return handler(args)

    return 0


def cmd_auth(args):
    """Dispatch auth subcommands."""
    if not args.auth_command:
        print("Error: Please specify an auth command (login, logout, create-user, status)", file=sys.stderr)
        return 1

    handlers = {
        'login': cmd_auth_login,
        'logout': cmd_auth_logout,
        'create-user': cmd_auth_create_user,
        'status': cmd_auth_status,
    }

    handler = handlers.get(args.auth_command)
    if handler:
        return handler(args)

    print(f"Error: Unknown auth command: {args.auth_command}", file=sys.stderr)
    return 1


if __name__ == '__main__':
    sys.exit(main())
