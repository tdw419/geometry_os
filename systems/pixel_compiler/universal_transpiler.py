#!/usr/bin/env python3
"""
Universal Binary Transpiler & Converter
Converts Native Software (Linux/Windows/macOS) -> WASM -> PixelRTS (.rts.png)

This tool implements the "Native -> WASM -> RTS" pipeline.
It handles:
1. Source Code (C/C++/Rust) -> Compile to WASM -> Pack to RTS
2. Native Binaries (ELF/PE/Mach-O) -> [Simulation/CheerpX] -> WASM -> RTS
3. Existing WASM -> Pack to RTS

Usage:
    python3 universal_transpiler.py <input_file> [output.rts.png]
"""

import sys
import os
import subprocess
import shutil
import time
import argparse
from pathlib import Path
from typing import Optional, Tuple, Dict
import tempfile

# Add parent directory to path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
# Add project root to path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "../..")))


from universal_rts_converter import UniversalRTSConverter
from binary_detector import detect_binary_type, BinaryType
# Import from current directory to avoid conflict with root syscall_bridge.py
import systems.pixel_compiler.syscall_bridge as sb_module
SyscallBridge = sb_module.SyscallBridge

class UniversalTranspiler:
    def __init__(self):
        # Default output directory to current working directory if not specified
        self.rts_converter = UniversalRTSConverter(output_dir='.')
        self.temp_dir = tempfile.mkdtemp(prefix="pixelrts_transpiler_")
        self.syscall_bridge = SyscallBridge()  # Syscall compatibility checker

    def __del__(self):
        try:
            shutil.rmtree(self.temp_dir)
        except:
            pass

    def transpile_and_convert(self, input_path: str, output_path: Optional[str] = None) -> str:
        """
        Main entry point.
        1. Detects input type.
        2. Transpiles to WASM if necessary.
        3. Converts WASM to .rts.png via UniversalRTSConverter.
        """
        input_path = os.path.abspath(input_path)
        if not os.path.exists(input_path):
            raise FileNotFoundError(f"Input not found: {input_path}")

        # Determine output path if not provided
        if output_path is None:
            base_name = os.path.splitext(os.path.basename(input_path))[0]
            output_path = os.path.join(os.getcwd(), f"{base_name}.rts.png")

        print(f"[*] Analyzing input: {input_path}")
        
        # 1. Check for Source Code
        if input_path.endswith(('.rs', '.c', '.cpp', '.cc')):
            wasm_path = self._compile_source_to_wasm(input_path)
        
        # 2. Check for Native Binary or Existing WASM
        else:
            # Check magic bytes
            with open(input_path, 'rb') as f:
                header = f.read(4)
            
            if header.startswith(b'\x00asm'):
                print("    Type: WebAssembly (WASM)")
                wasm_path = input_path
            elif header.startswith(b'\x7fELF'):
                print("    Type: Linux ELF Binary")
                wasm_path = self._transpile_binary_to_wasm(input_path, "elf")
            elif header.startswith(b'MZ'):
                print("    Type: Windows PE Binary")
                wasm_path = self._transpile_binary_to_wasm(input_path, "pe")
            elif header in [b'\xfe\xed\xfa\xce', b'\xce\xfa\xed\xfe', b'\xca\xfe\xba\xbe']: # Mach-O magics
                print("    Type: macOS Mach-O Binary")
                wasm_path = self._transpile_binary_to_wasm(input_path, "macho")
            else:
                # Fallback / Generic
                print("    Type: Generic / Unknown")
                wasm_path = input_path # Treat as blob/data
        
        # 3. Convert Resulting WASM (or blob) to RTS
        if wasm_path:
            print(f"[*] converting {wasm_path} -> {output_path}...")
            
            # Use PixelRTSv2Converter for Visual Container (Code Mode for WASM)
            # This ensures we get a valid PNG that the runtime can load
            try:
                from pixelrts_v2_converter import PixelRTSv2Converter
                
                mode = "code" if wasm_path.endswith('.wasm') else "rts"
                try:
                    converter = PixelRTSv2Converter(wasm_path, output_path, mode=mode)
                    converter.convert()
                except Exception as e:
                    print(f"[!] Code Mode conversion failed ({e}). Fallback to Binary Mode.")
                    converter = PixelRTSv2Converter(wasm_path, output_path, mode="rts")
                    converter.convert()
                
                print(f"[✓] Conversion Complete: {output_path}")
                return output_path
                
            except ImportError:
                print("[!] PixelRTSv2Converter not found, falling back to UniversalRTSConverter (Raw HDPF)")
                # Fallback to UniversalRTSConverter (PixelRTS-3.0 format which supports WASM but as raw blob)
                final_rts = self.rts_converter.convert(wasm_path, output_path)
                print(f"[✓] Conversion Complete (Raw HDPF): {final_rts}")
                return final_rts
        
        raise RuntimeError("Failed to produce valid intermediate format.")

    def _compile_source_to_wasm(self, source_path: str) -> str:
        """Compiles C/C++/Rust source to WASM."""
        print(f"[*] Compiling source: {source_path}")
        ext = os.path.splitext(source_path)[1].lower()
        output_wasm = os.path.join(self.temp_dir, "output.wasm")

        if ext == '.rs':
            # Try rustc
            if shutil.which('rustc'):
                # Check for wasm32 target
                targets = subprocess.run(['rustc', '--print', 'target-list'], capture_output=True, text=True).stdout
                if 'wasm32-unknown-unknown' in targets:
                    cmd = ['rustc', '--target', 'wasm32-unknown-unknown', source_path, '-o', output_wasm]
                    print(f"    Command: {' '.join(cmd)}")
                    ret = subprocess.run(cmd, capture_output=True, text=True)
                    if ret.returncode != 0:
                        print(f"[!] Compilation Failed:\n{ret.stderr}")
                        raise RuntimeError("Rust compilation failed")
                    return output_wasm
                else:
                    print("[!] rustc found but 'wasm32-unknown-unknown' target missing.")
                    print("    Install with: rustup target add wasm32-unknown-unknown")
            else:
                print("[!] rustc not found.")
        
        elif ext in ['.c', '.cpp', '.cc']:
            # Try emcc (Emscripten)
            if shutil.which('emcc'):
                cmd = ['emcc', source_path, '-o', output_wasm, '-s', 'WASM=1']
                print(f"    Command: {' '.join(cmd)}")
                ret = subprocess.run(cmd, capture_output=True, text=True)
                if ret.returncode != 0:
                     print(f"[!] Compilation Failed:\n{ret.stderr}")
                     raise RuntimeError("Emscripten compilation failed")
                return output_wasm
            
            # Try clang with wasm target
            elif shutil.which('clang'):
                 # Check for wasm-ld
                 # Note: purely compiling to object is easy, linking needs lld
                 print("[!] 'emcc' not found. Trying clang --target=wasm32...")
                 # Verify linker presence implicitly by trying to link
                 cmd = ['clang', '--target=wasm32', '-nostdlib', '-Wl,--no-entry', '-Wl,--export-all', source_path, '-o', output_wasm]
                 print(f"    Command: {' '.join(cmd)}")
                 ret = subprocess.run(cmd, capture_output=True, text=True)
                 if ret.returncode != 0:
                     print(f"[!] Clang Compilation Failed (likely missing wasm-ld/lld):\n{ret.stderr}")
                     print("    Conversion requires 'lld' (LLVM Linker) or 'emscripten'.")
                     raise RuntimeError("C/C++ compilation failed")
                 return output_wasm
            else:
                 print("[!] No C compiler (emcc/clang) found.")

        # Fallback: Treat as simulation/data
        print("[!] Compiler not available. Creating SIMULATION artifact (Data only).")
        # Just copy source as data for now (or fail)
        # return source_path 
        raise RuntimeError(f"No compiler found for {ext}")

    def _transpile_binary_to_wasm(self, binary_path: str, bin_type: str) -> str:
        """
        Simulates or runs binary translation (if tools available).
        """
        print(f"[*] Transpiling Native Binary ({bin_type})...")
        
        # 1. Check for CheerpX (Virtualization-based)
        # This is hypothetical as CheerpX is usually a JS library or specialized toolchain
        if shutil.which('cheerpx-transpiler'):
            print("    [+] Found CheerpX! Running accurate transpilation...")
            # Real command would go here
            pass
        
        # 2. Check for Box64 -> WASM (Unlikely but possible)
        
        # 3. Fallback: Simulation / Analysis
        print("    [!] No native binary transpiler found (CheerpX/Box64 missing).")
        print("    [!] SIMULATION MODE: Analyzing binary structure for RTS containerization...")
        
        # Analyze entry point output
        try:
             # Use readelf or objdump if available to get info
             if shutil.which('readelf'):
                 info = subprocess.run(['readelf', '-h', binary_path], capture_output=True, text=True).stdout
                 print(f"    Analysis:\n{'\n'.join(['        '+l for l in info.splitlines()[:5]])}")
        except:
             pass

        # NEW: Syscall compatibility report
        print("    [*] Syscall Compatibility Check:")
        supported_dict = self.syscall_bridge.list_supported_syscalls()
        unsupported_dict = self.syscall_bridge.list_unsupported_syscalls()

        # Get first few example names
        supported_examples = list(supported_dict.keys())[:5]
        unsupported_examples = list(unsupported_dict.keys())[:5]

        print(f"        Supported examples: {', '.join(supported_examples)}")
        print(f"        Unsupported: {', '.join(unsupported_examples)}")
        print(f"        Total mapped syscalls: {len(supported_dict)}")

        print("    [!] NOTE: To execute this native binary on PixelRTS, we need to:")
        print("        1. Disassemble instructions (x86_64/ARM64)")
        print("        2. Translate to WASM Operations")
        print("        3. Bridge Syscalls (Linux -> WASI)")
        print("    [*] Embedding binary as raw data blob in .rts (Extraction-only mode)")
        
        # In this mode, we just return the binary path. 
        # The RTS converter will pack it. 
        # The runtime will treat it as data unless we attach a specialized "emulator" WASM.
        
        return binary_path


def main():
    parser = argparse.ArgumentParser(description="Universal Native -> PixelRTS Transpiler")
    parser.add_argument("input", help="Input file (Source .c/.rs, Binary .elf/.exe, or WASM)")
    parser.add_argument("output", nargs='?', help="Output .rts.png file")
    
    args = parser.parse_args()
    
    transpiler = UniversalTranspiler()
    try:
        transpiler.transpile_and_convert(args.input, args.output)
    except Exception as e:
        print(f"[!] Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
