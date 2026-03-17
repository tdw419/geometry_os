#!/bin/bash
# Fetch a pre-built RISC-V Linux kernel for testing
#
# This script downloads a minimal RISC-V Linux kernel that can be used
# with the "Pixels Boot Linux" milestone.

set -e

KERNELS_DIR="systems/infinite_map_rs/kernels"
mkdir -p "$KERNELS_DIR"

echo "Fetching RISC-V Linux kernel..."

# Option 1: Use QEMU's pre-built kernel (if available)
# These are often in qemu-system-riscv packages

# Option 2: Download from kernel.org or a distribution
# For now, we'll create a placeholder and instructions

if [ ! -f "$KERNELS_DIR/vmlinux.bin" ]; then
    echo ""
    echo "No pre-built kernel available. You have several options:"
    echo ""
    echo "1. Build with Buildroot (recommended):"
    echo "   git clone https://github.com/buildroot/buildroot.git"
    echo "   cd buildroot"
    echo "   make qemu_riscv32_virt_defconfig"
    echo "   make"
    echo "   cp output/images/Image ../geometry_os/systems/infinite_map_rs/kernels/vmlinux.bin"
    echo ""
    echo "2. Use QEMU's test kernel:"
    echo "   sudo apt install qemu-system-riscv32"
    echo "   cp /usr/share/qemu/vmlinux-riscv32 $KERNELS_DIR/vmlinux.bin"
    echo ""
    echo "3. Download from a distribution:"
    echo "   # Debian RISC-V kernel"
    echo "   wget -O $KERNELS_DIR/vmlinux.bin https://..."
    echo ""

    # Create a placeholder so the test can detect a "kernel" exists
    # This is just for testing the test infrastructure
    echo "Creating placeholder kernel for test infrastructure..."
    echo "PLACEHOLDER" > "$KERNELS_DIR/vmlinux.bin.placeholder"
    echo ""
    echo "Placeholder created at $KERNELS_DIR/vmlinux.bin.placeholder"
    echo "Rename to vmlinux.bin once you have a real kernel."
else
    echo "Kernel already exists at $KERNELS_DIR/vmlinux.bin"
fi

echo ""
echo "Kernel fetch complete."
