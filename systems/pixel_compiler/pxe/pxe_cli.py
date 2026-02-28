#!/usr/bin/env python3
"""
PXE CLI - Command-line interface for PXE boot server management.

Provides commands for managing DHCP, TFTP, and HTTP servers for PXE
network booting.

Usage:
    pixelrts pxe dhcp start [OPTIONS]
    pixelrts pxe dhcp stop                    # Future: stop running server
    pixelrts pxe status                       # Future: show PXE stack status
"""

import argparse
import logging
import sys
from typing import Optional

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='[%(levelname)s] %(message)s'
)
logger = logging.getLogger(__name__)


def create_parser(subparsers=None):
    """
    Create argument parser for PXE commands.

    This function supports two modes:
    1. Standalone mode: Creates a full ArgumentParser for the pxe command
    2. Integration mode: Adds pxe subcommands to an existing parser's subparsers

    Args:
        subparsers: Optional existing subparsers to add pxe commands to

    Returns:
        ArgumentParser if subparsers is None, otherwise None
    """
    if subparsers is None:
        # Standalone mode - create full parser
        parser = argparse.ArgumentParser(
            prog='pixelrts pxe',
            description='PXE boot server management',
            formatter_class=argparse.RawDescriptionHelpFormatter,
            epilog="""
Examples:
  # Start DHCP server with default settings
  pixelrts pxe dhcp start

  # Start DHCP server on specific interface
  pixelrts pxe dhcp start --interface eth1

  # Configure custom IP range and bootfile
  pixelrts pxe dhcp start --ip-range-start 10.0.0.100 --ip-range-end 10.0.0.200 --bootfile myboot.pxe

  # Specify TFTP server (for multi-server setups)
  pixelrts pxe dhcp start --tftp-server 192.168.1.10 --server-ip 192.168.1.1
"""
        )
        pxe_subparsers = parser.add_subparsers(dest='pxe_command')
        root_parser = parser  # Keep reference to return
    else:
        # Integration mode - add to existing subparsers
        pxe_parser = subparsers.add_parser(
            'pxe',
            help='PXE boot server management',
            description='Manage DHCP, TFTP, and HTTP servers for PXE network booting'
        )
        pxe_subparsers = pxe_parser.add_subparsers(dest='pxe_command')
        root_parser = None  # Don't return in integration mode

    # DHCP subcommand
    dhcp_parser = pxe_subparsers.add_parser(
        'dhcp',
        help='DHCP server',
        description='Manage DHCP server for PXE boot'
    )
    dhcp_subparsers = dhcp_parser.add_subparsers(dest='dhcp_command')

    # start subcommand
    start_parser = dhcp_subparsers.add_parser(
        'start',
        help='Start DHCP server for PXE boot',
        description='Start a DHCP server that provides IP addresses and PXE boot options to network clients',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )

    # Network configuration
    start_parser.add_argument(
        '-i', '--interface',
        default='eth0',
        help='Network interface to bind (default: eth0)'
    )
    start_parser.add_argument(
        '--server-ip',
        default='192.168.1.1',
        help='IP address of this DHCP/TFTP server (default: 192.168.1.1)'
    )
    start_parser.add_argument(
        '--ip-range-start',
        default='192.168.1.100',
        help='Start of IP range for PXE clients (default: 192.168.1.100)'
    )
    start_parser.add_argument(
        '--ip-range-end',
        default='192.168.1.200',
        help='End of IP range for PXE clients (default: 192.168.1.200)'
    )
    start_parser.add_argument(
        '--subnet-mask',
        default='255.255.255.0',
        help='Subnet mask for clients (default: 255.255.255.0)'
    )
    start_parser.add_argument(
        '--lease-time',
        type=int,
        default=3600,
        help='DHCP lease time in seconds (default: 3600)'
    )

    # PXE configuration
    start_parser.add_argument(
        '-t', '--tftp-server',
        default=None,
        help='TFTP server IP (default: same as server-ip)'
    )
    start_parser.add_argument(
        '-b', '--bootfile',
        default='ipxe.pxe',
        help='PXE boot filename (default: ipxe.pxe)'
    )

    # Verbosity
    start_parser.add_argument(
        '-v', '--verbose',
        action='store_true',
        help='Enable verbose logging'
    )

    # stop subcommand (placeholder for future)
    stop_parser = dhcp_subparsers.add_parser(
        'stop',
        help='Stop running DHCP server (future)',
        description='Stop a running DHCP server'
    )
    stop_parser.add_argument(
        '--force',
        action='store_true',
        help='Force stop without graceful shutdown'
    )

    # status subcommand (placeholder for future)
    status_parser = pxe_subparsers.add_parser(
        'status',
        help='Show PXE stack status (future)',
        description='Display status of all PXE services'
    )
    status_parser.add_argument(
        '--json',
        action='store_true',
        help='Output in JSON format'
    )

    return root_parser


def cmd_dhcp_start(args: argparse.Namespace) -> int:
    """
    Start DHCP server with parsed arguments.

    Args:
        args: Parsed command-line arguments

    Returns:
        Exit code (0 for success, non-zero for error)
    """
    import asyncio
    from .dhcp_server import DHCPServer, DHCPServerConfig

    # Build config from args
    config = DHCPServerConfig(
        interface=args.interface,
        server_ip=args.server_ip,
        ip_range_start=args.ip_range_start,
        ip_range_end=args.ip_range_end,
        subnet_mask=args.subnet_mask,
        lease_time=args.lease_time,
        tftp_server=args.tftp_server or args.server_ip,
        bootfile=args.bootfile,
    )

    # Configure logging level
    log_level = logging.DEBUG if args.verbose else logging.INFO
    logging.getLogger().setLevel(log_level)

    # Log startup configuration
    logger.info(f"[DHCP] Starting server on interface {config.interface}")
    logger.info(f"[DHCP] Server IP: {config.server_ip}")
    logger.info(f"[DHCP] IP range: {config.ip_range_start} - {config.ip_range_end}")
    logger.info(f"[DHCP] TFTP server: {config.tftp_server}")
    logger.info(f"[DHCP] Bootfile: {config.bootfile}")
    logger.info(f"[DHCP] Lease time: {config.lease_time}s")

    # Create and run server
    server = DHCPServer(config)

    try:
        asyncio.run(server.serve_forever())
    except KeyboardInterrupt:
        logger.info("[DHCP] Server stopped by user")
        return 0
    except PermissionError as e:
        logger.error(f"[DHCP] Permission denied - need root to bind to port 67: {e}")
        return 1
    except Exception as e:
        logger.error(f"[DHCP] Server error: {e}")
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1

    return 0


def cmd_dhcp_stop(args: argparse.Namespace) -> int:
    """
    Stop running DHCP server (placeholder for future implementation).

    Args:
        args: Parsed command-line arguments

    Returns:
        Exit code (0 for success, non-zero for error)
    """
    logger.error("[DHCP] Stop command not yet implemented")
    logger.info("[DHCP] Use Ctrl+C to stop the running server")
    return 1


def cmd_status(args: argparse.Namespace) -> int:
    """
    Show PXE stack status (placeholder for future implementation).

    Args:
        args: Parsed command-line arguments

    Returns:
        Exit code (0 for success, non-zero for error)
    """
    logger.error("[PXE] Status command not yet implemented")
    return 1


def main(args: argparse.Namespace) -> int:
    """
    Main entry point for PXE commands.

    Routes commands to their appropriate handlers.

    Args:
        args: Parsed command-line arguments

    Returns:
        Exit code (0 for success, non-zero for error)
    """
    if args.pxe_command == 'dhcp':
        if args.dhcp_command == 'start':
            return cmd_dhcp_start(args)
        elif args.dhcp_command == 'stop':
            return cmd_dhcp_stop(args)
        else:
            logger.error(f"Unknown DHCP command: {args.dhcp_command}")
            return 1
    elif args.pxe_command == 'status':
        return cmd_status(args)
    else:
        logger.error(f"Unknown PXE command: {args.pxe_command}")
        return 1


if __name__ == '__main__':
    parser = create_parser()
    args = parser.parse_args()

    if not args.pxe_command:
        parser.print_help()
        sys.exit(1)

    sys.exit(main(args))
