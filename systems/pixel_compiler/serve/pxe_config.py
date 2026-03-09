"""
PXE Configuration Generator

Generates pxelinux configuration files for PXE boot. These configuration files
tell PXE clients which kernel and initrd to boot, and what kernel parameters
to use.

Key Features:
    - Generate pxelinux.cfg/default content
    - Support kernel/initrd/NBD configuration
    - Generate iPXE scripts for HTTP boot (Phase 7)
    - Document required boot files

Generated Config Format (pxelinux.cfg/default):
    DEFAULT linux
    TIMEOUT 50
    PROMPT 0

    LABEL linux
        KERNEL vmlinuz
        APPEND initrd=initrd.img nbdroot=SERVER_IP:10809 root=/dev/nbd0

Required Boot Files (from syslinux/pxelinux package):
    - pxelinux.0       - PXE bootloader
    - ldlinux.c32      - Syslinux core module
    - vesamenu.c32     - Optional: graphical menu
    - libcom32.c32     - Optional: com32 support
    - libutil.c32      - Optional: utility functions

Usage:
    config = PXEConfig()
    content = config.generate_default_config("192.168.1.100", 10809)
    config.write_config("/srv/tftp/pxelinux.cfg", content)
"""

import os
import urllib.request
import logging
from pathlib import Path
from typing import Optional, List, Dict, Any

logger = logging.getLogger(__name__)


class PXEConfig:
    """
    Generates PXE boot configuration files.

    Creates pxelinux configuration for network booting with NBD root.

    Example:
        config = PXEConfig()
        content = config.generate_default_config("192.168.1.100", 10809)
        config.write_config("/srv/tftp/pxelinux.cfg", content)
    """

    # Default kernel parameters
    DEFAULT_KERNEL = "vmlinuz"
    DEFAULT_INITRD = "initrd.img"
    DEFAULT_TIMEOUT = 50  # 5 seconds (units of 0.1s)
    DEFAULT_PROMPT = False

    # Required boot files from syslinux/pxelinux
    REQUIRED_BOOT_FILES = [
        "pxelinux.0",      # PXE bootloader (required)
        "ldlinux.c32",     # Syslinux core module (required)
        "vesamenu.c32",    # Graphical menu (optional)
        "libcom32.c32",    # com32 support (optional)
        "libutil.c32",     # Utility functions (optional)
    ]

    # iPXE boot file for HTTP chainloading (Phase 7)
    # Standard iPXE UNDI driver - allows HTTP boot instead of TFTP
    IPXE_BOOT_FILE = "undionly.kpxe"

    # URL for downloading undionly.kpxe from iPXE CDN
    IPXE_DOWNLOAD_URL = "https://boot.ipxe.org/undionly.kpxe"

    def __init__(
        self,
        kernel: str = DEFAULT_KERNEL,
        initrd: str = DEFAULT_INITRD,
        timeout: int = DEFAULT_TIMEOUT,
        prompt: bool = DEFAULT_PROMPT
    ):
        """
        Initialize PXE config generator.

        Args:
            kernel: Kernel filename (default: vmlinuz)
            initrd: Initrd filename (default: initrd.img)
            timeout: Boot timeout in 0.1s units (default: 50 = 5 seconds)
            prompt: Show boot prompt (default: False)
        """
        self.kernel = kernel
        self.initrd = initrd
        self.timeout = timeout
        self.prompt = prompt

    def generate_default_config(
        self,
        server_ip: str,
        nbd_port: int = 10809,
        label: str = "linux",
        cmdline_extras: Optional[str] = None
    ) -> str:
        """
        Generate pxelinux.cfg/default content.

        Args:
            server_ip: NBD server IP address
            nbd_port: NBD server port (default: 10809)
            label: Boot label name (default: "linux")
            cmdline_extras: Extra kernel command line parameters

        Returns:
            pxelinux.cfg/default content string

        Example output:
            DEFAULT linux
            TIMEOUT 50
            PROMPT 0

            LABEL linux
                KERNEL vmlinuz
                APPEND initrd=initrd.img nbdroot=192.168.1.100:10809 root=/dev/nbd0
        """
        prompt_val = 1 if self.prompt else 0

        # Build kernel command line
        cmdline_parts = [
            f"initrd={self.initrd}",
            f"nbdroot={server_ip}:{nbd_port}",
            "root=/dev/nbd0",
        ]

        if cmdline_extras:
            cmdline_parts.append(cmdline_extras)

        cmdline = " ".join(cmdline_parts)

        config = f"""DEFAULT {label}
TIMEOUT {self.timeout}
PROMPT {prompt_val}

LABEL {label}
    KERNEL {self.kernel}
    APPEND {cmdline}
"""
        return config

    def generate_ipxe_script(
        self,
        server_ip: str,
        http_port: int = 8080,
        nbd_port: int = 10809,
        kernel_url: Optional[str] = None,
        initrd_url: Optional[str] = None
    ) -> str:
        """
        Generate iPXE script for HTTP boot (Phase 7).

        HTTP boot is faster than TFTP for large files like kernels and initrds.

        Args:
            server_ip: HTTP server IP address
            http_port: HTTP server port (default: 8080)
            nbd_port: NBD server port (default: 10809)
            kernel_url: Full URL to kernel (default: http://server:port/vmlinuz)
            initrd_url: Full URL to initrd (default: http://server:port/initrd.img)

        Returns:
            iPXE script content

        Example output:
            #!ipxe
            kernel http://192.168.1.100:8080/vmlinuz initrd=initrd.img nbdroot=192.168.1.100:10809 root=/dev/nbd0
            initrd http://192.168.1.100:8080/initrd.img
            boot
        """
        base_url = f"http://{server_ip}:{http_port}"

        if kernel_url is None:
            kernel_url = f"{base_url}/{self.kernel}"
        if initrd_url is None:
            initrd_url = f"{base_url}/{self.initrd}"

        cmdline = f"initrd={self.initrd} nbdroot={server_ip}:{nbd_port} root=/dev/nbd0"

        script = f"""#!ipxe
kernel {kernel_url} {cmdline}
initrd {initrd_url}
boot
"""
        return script

    def write_config(self, output_dir: str, config: str, filename: str = "default") -> Path:
        """
        Write configuration to file.

        Creates the output directory if it doesn't exist.

        Args:
            output_dir: Directory to write config (e.g., /srv/tftp/pxelinux.cfg)
            config: Configuration content
            filename: Config filename (default: "default")

        Returns:
            Path to written file
        """
        output_path = Path(output_dir)
        output_path.mkdir(parents=True, exist_ok=True)

        config_file = output_path / filename
        config_file.write_text(config)

        return config_file

    def get_required_boot_files(self, include_optional: bool = False) -> List[str]:
        """
        Get list of required boot files.

        Args:
            include_optional: Include optional files (default: False)

        Returns:
            List of required boot filenames
        """
        if include_optional:
            return self.REQUIRED_BOOT_FILES.copy()
        else:
            # Only return required files
            return ["pxelinux.0", "ldlinux.c32"]

    def generate_boot_file_list(self, include_optional: bool = False) -> str:
        """
        Generate documentation listing required boot files.

        Args:
            include_optional: Include optional files (default: False)

        Returns:
            Formatted string listing required files
        """
        files = self.get_required_boot_files(include_optional)

        doc = """# Required Boot Files

These files must be present in the TFTP root directory.
They are typically installed from the syslinux/pxelinux package.

"""
        for f in files:
            optional = " (optional)" if f not in ["pxelinux.0", "ldlinux.c32"] else ""
            doc += f"- {f}{optional}\n"

        doc += """
# Installation (Debian/Ubuntu)
sudo apt-get install pxelinux syslinux-common

# Installation (RHEL/CentOS)
sudo yum install syslinux

# Copy files to TFTP root
cp /usr/lib/PXELINUX/pxelinux.0 /srv/tftp/
cp /usr/lib/syslinux/modules/bios/ldlinux.c32 /srv/tftp/
"""
        return doc

    def generate_pxelinux_cfg_directory(
        self,
        output_dir: str,
        server_ip: str,
        nbd_port: int = 10809
    ) -> Path:
        """
        Generate complete pxelinux.cfg directory with default configuration.

        Args:
            output_dir: Base directory (e.g., /srv/tftp)
            server_ip: NBD server IP address
            nbd_port: NBD server port

        Returns:
            Path to pxelinux.cfg directory
        """
        cfg_dir = Path(output_dir) / "pxelinux.cfg"
        cfg_dir.mkdir(parents=True, exist_ok=True)

        config = self.generate_default_config(server_ip, nbd_port)
        self.write_config(str(cfg_dir), config)

        return cfg_dir

    @staticmethod
    def get_client_config_filename(client_mac: str) -> str:
        """
        Get pxelinux config filename for a specific client MAC.

        pxelinux looks for config files in this order:
        1. /pxelinux.cfg/01-88-99-aa-bb-cc-dd (MAC address)
        2. /pxelinux.cfg/C0A80001 (IP address in hex)
        3. /pxelinux.cfg/C0A800 (IP prefix)
        4. /pxelinux.cfg/C0A8 (IP prefix)
        5. /pxelinux.cfg/C0 (IP prefix)
        6. /pxelinux.cfg/default

        Args:
            client_mac: Client MAC address (e.g., "88:99:aa:bb:cc:dd")

        Returns:
            Config filename (e.g., "01-88-99-aa-bb-cc-dd")
        """
        # Normalize MAC format
        mac = client_mac.lower().replace("-", ":").replace(".", ":")
        return "01-" + mac.replace(":", "-")

    def generate_ipxe_chainload_config(
        self,
        server_ip: str,
        http_port: int = 8080,
        nbd_port: int = 10809
    ) -> str:
        """
        Generate pxelinux.cfg/default that chainloads iPXE for HTTP boot.

        This enables the chainload flow:
        1. Client PXE boots -> receives undionly.kpxe via TFTP (slow)
        2. iPXE loads -> fetches boot.ipxe via HTTP (fast)
        3. HTTP boot script -> loads kernel/initrd via HTTP (fast)

        Using HTTP for kernel/initrd transfer is significantly faster than TFTP,
        especially for large files (50-200MB kernel+initrd).

        Args:
            server_ip: HTTP server IP address
            http_port: HTTP server port (default: 8080)
            nbd_port: NBD server port (default: 10809)

        Returns:
            pxelinux.cfg/default content that loads iPXE

        Example output:
            DEFAULT ipxe
            TIMEOUT 50
            PROMPT 0

            LABEL ipxe
                KERNEL undionly.kpxe
        """
        config = f"""DEFAULT ipxe
TIMEOUT {self.timeout}
PROMPT 0

LABEL ipxe
    KERNEL {self.IPXE_BOOT_FILE}
"""
        return config

    def get_ipxe_boot_files(self) -> List[str]:
        """
        Get list of iPXE boot files needed for HTTP chainload.

        Returns:
            List containing "undionly.kpxe"

        Note:
            undionly.kpxe is the standard iPXE UNDI driver that works
            with most network cards. It can be downloaded from:
            https://boot.ipxe.org/undionly.kpxe
        """
        return [self.IPXE_BOOT_FILE]

    @classmethod
    def get_ipxe_boot_file_url(cls) -> str:
        """
        Get the URL for downloading undionly.kpxe from iPXE CDN.

        Returns:
            URL string: "https://boot.ipxe.org/undionly.kpxe"
        """
        return cls.IPXE_DOWNLOAD_URL

    @classmethod
    def ensure_ipxe_boot_files(cls, tftp_root: Path) -> bool:
        """
        Ensure undionly.kpxe is available in the TFTP root directory.

        Checks if the file exists, and if not, attempts to download it
        from the iPXE CDN. This is a best-effort download - if it fails,
        the user must manually place undionly.kpxe in the TFTP root.

        Args:
            tftp_root: Path to TFTP root directory

        Returns:
            True if file is available (existing or downloaded), False otherwise

        Example:
            >>> from pathlib import Path
            >>> PXEConfig.ensure_ipxe_boot_files(Path("/srv/tftp"))
            True
        """
        tftp_root = Path(tftp_root)
        ipxe_file = tftp_root / cls.IPXE_BOOT_FILE

        # Check if file already exists
        if ipxe_file.exists() and ipxe_file.stat().st_size > 0:
            logger.debug(f"iPXE boot file already exists: {ipxe_file}")
            return True

        # Ensure directory exists
        tftp_root.mkdir(parents=True, exist_ok=True)

        # Attempt download
        logger.info(f"Downloading iPXE boot file from {cls.IPXE_DOWNLOAD_URL}")
        if cls._download_file(cls.IPXE_DOWNLOAD_URL, ipxe_file):
            logger.info(f"Successfully downloaded {cls.IPXE_BOOT_FILE}")
            return True
        else:
            logger.warning(
                f"Failed to download {cls.IPXE_BOOT_FILE}. "
                f"Please manually download from {cls.IPXE_DOWNLOAD_URL} "
                f"and place in {tftp_root}"
            )
            return False

    @staticmethod
    def _download_file(url: str, dest: Path) -> bool:
        """
        Download a file from URL to destination path.

        Args:
            url: Source URL
            dest: Destination path

        Returns:
            True if download succeeded, False otherwise
        """
        try:
            urllib.request.urlretrieve(url, dest)
            return True
        except Exception as e:
            logger.debug(f"Download failed: {e}")
            return False

    def __repr__(self) -> str:
        return f"PXEConfig(kernel={self.kernel}, initrd={self.initrd})"
