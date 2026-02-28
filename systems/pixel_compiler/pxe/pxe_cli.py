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

  # Start TFTP server serving bootloader files
  pixelrts pxe tftp start --root-dir /var/tftpboot

  # Start TFTP on custom port with verbose logging
  pixelrts pxe tftp start --port 6969 --verbose
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

    # TFTP subcommand
    tftp_parser = pxe_subparsers.add_parser(
        'tftp',
        help='TFTP server',
        description='Manage TFTP server for PXE boot'
    )
    tftp_subparsers = tftp_parser.add_subparsers(dest='tftp_command')

    # TFTP start subcommand
    tftp_start_parser = tftp_subparsers.add_parser(
        'start',
        help='Start TFTP server for PXE boot',
        description='Start a TFTP server that serves bootloader files to PXE clients',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )

    # Network configuration
    tftp_start_parser.add_argument(
        '-i', '--interface',
        default='0.0.0.0',
        help='Network interface to bind (default: 0.0.0.0)'
    )
    tftp_start_parser.add_argument(
        '-p', '--port',
        type=int,
        default=69,
        help='TFTP server port (default: 69)'
    )

    # File serving configuration
    tftp_start_parser.add_argument(
        '-r', '--root-dir',
        default='/tftpboot',
        help='Root directory containing boot files (default: /tftpboot)'
    )
    tftp_start_parser.add_argument(
        '-b', '--block-size',
        type=int,
        default=512,
        help='TFTP block size in bytes (default: 512)'
    )

    # Timeout configuration
    tftp_start_parser.add_argument(
        '-t', '--timeout',
        type=float,
        default=5.0,
        help='Retransmission timeout in seconds (default: 5.0)'
    )
    tftp_start_parser.add_argument(
        '--max-retries',
        type=int,
        default=5,
        help='Maximum retransmission attempts (default: 5)'
    )

    # Verbosity
    tftp_start_parser.add_argument(
        '-v', '--verbose',
        action='store_true',
        help='Enable verbose logging'
    )

    # TFTP stop subcommand (placeholder for future)
    tftp_stop_parser = tftp_subparsers.add_parser(
        'stop',
        help='Stop running TFTP server (future)',
        description='Stop a running TFTP server'
    )
    tftp_stop_parser.add_argument(
        '--force',
        action='store_true',
        help='Force stop without graceful shutdown'
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


def cmd_tftp_start(args: argparse.Namespace) -> int:
    """
    Start TFTP server with parsed arguments.

    Args:
        args: Parsed command-line arguments

    Returns:
        Exit code (0 for success, non-zero for error)
    """
    import asyncio
    import os
    from .tftp_server import TFTPServer, TFTPServerConfig

    # Validate root directory exists
    if not os.path.isdir(args.root_dir):
        logger.error(f"[TFTP] Root directory does not exist: {args.root_dir}")
        logger.info(f"[TFTP] Create it with: sudo mkdir -p {args.root_dir}")
        return 1

    # Build config from args
    config = TFTPServerConfig(
        interface=args.interface,
        listen_port=args.port,
        root_dir=args.root_dir,
        block_size=args.block_size,
        timeout=args.timeout,
        max_retries=args.max_retries,
    )

    # Configure logging level
    log_level = logging.DEBUG if args.verbose else logging.INFO
    logging.getLogger().setLevel(log_level)

    # Log startup configuration
    logger.info(f"[TFTP] Starting server on {config.interface}:{config.listen_port}")
    logger.info(f"[TFTP] Root directory: {config.root_dir}")
    logger.info(f"[TFTP] Block size: {config.block_size} bytes")
    logger.info(f"[TFTP] Timeout: {config.timeout}s, Max retries: {config.max_retries}")

    # List available boot files
    try:
        files = [f for f in os.listdir(config.root_dir) if os.path.isfile(os.path.join(config.root_dir, f))]
        if files:
            logger.info(f"[TFTP] Available files: {', '.join(files[:5])}{'...' if len(files) > 5 else ''}")
        else:
            logger.warning(f"[TFTP] No files in root directory")
    except PermissionError:
        logger.warning(f"[TFTP] Cannot list files in root directory (permission denied)")

    # Create and run server
    server = TFTPServer(config)

    try:
        asyncio.run(server.serve_forever())
    except KeyboardInterrupt:
        logger.info("[TFTP] Server stopped by user")
        return 0
    except PermissionError as e:
        logger.error(f"[TFTP] Permission denied - need root to bind to port {config.listen_port}: {e}")
        return 1
    except Exception as e:
        logger.error(f"[TFTP] Server error: {e}")
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1

    return 0


def cmd_tftp_stop(args: argparse.Namespace) -> int:
    """
    Stop running TFTP server (placeholder for future implementation).

    Args:
        args: Parsed command-line arguments

    Returns:
        Exit code (0 for success, non-zero for error)
    """
    logger.error("[TFTP] Stop command not yet implemented")
    logger.info("[TFTP] Use Ctrl+C to stop the running server")
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
    elif args.pxe_command == 'tftp':
        if args.tftp_command == 'start':
            return cmd_tftp_start(args)
        elif args.tftp_command == 'stop':
            return cmd_tftp_stop(args)
        else:
            logger.error(f"Unknown TFTP command: {args.tftp_command}")
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
