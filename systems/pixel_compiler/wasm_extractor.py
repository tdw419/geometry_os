import sys
from pathlib import Path
from typing import Dict, Tuple, Optional, Any
import struct

# Import PixelRTSDecoder from the same package
try:
    from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder
except ImportError:
    # Fallback for different import contexts
    try:
        from pixelrts_v2_core import PixelRTSDecoder
    except ImportError:
        # Final fallback/Mock for testing if dependency missing
        class PixelRTSDecoder:
            def load(self, path, verify_hash=False):
                with open(path, "rb") as f:
                    return f.read()

class WASMExtractor:
    """
    Extracts WASM binary from .rts.png files and parses
    WASM structure to find function entry points.
    """

    def __init__(self):
        self.decoder = PixelRTSDecoder()

    def extract_from_file(self, rts_png_path: str) -> bytes:
        """
        Extract raw WASM bytes from a .rts.png file.
        The decoder.load() method automatically loads sidecar .meta.json metadata
        which is required for code mode cartridges.
        """
        return self.decoder.load(rts_png_path)

    def get_export_pc(self, wasm_bytes: bytes, export_name: str) -> Optional[int]:
        """
        Find the Program Counter (PC) offset for an exported function.
        Returns None if not found.
        """
        # Parse WASM binary format to find exports and code section
        try:
            return self._parse_wasm_exports(wasm_bytes).get(export_name)
        except Exception as e:
            print(f"Error parsing WASM: {e}")
            return None

    def _parse_wasm_exports(self, data: bytes) -> Dict[str, int]:
        """
        Parse WASM binary to map export names to code offsets (PCs).
        Robust against padding/trailing bytes.
        """
        exports = {}
        
        # Check magic and version
        if len(data) < 8 or data[0:4] != b'\x00asm':
            raise ValueError("Invalid WASM magic")
        
        pos = 8
        length = len(data)
        
        # We need to map function index -> code offset
        import_count = 0
        function_count = 0
        code_section_offset = 0
        export_section_offset = 0
        function_section_offset = 0
        
        while pos < length:
            try:
                section_id = data[pos]
                pos += 1
                section_len, len_bytes = self._read_leb128(data, pos)
                pos += len_bytes
                section_start = pos
                section_end = pos + section_len
                
                if section_id == 2:  # Import Section
                    # Count function imports
                    num_imports, kb = self._read_leb128(data, pos)
                    pos += kb
                    for _ in range(num_imports):
                        # Skip module name
                        mod_len, kb = self._read_leb128(data, pos)
                        pos += kb + mod_len
                        # Skip field name
                        field_len, kb = self._read_leb128(data, pos)
                        pos += kb + field_len
                        # Import kind
                        kind = data[pos]
                        pos += 1
                        if kind == 0:  # Function import
                            import_count += 1
                            # Skip type index
                            _, kb = self._read_leb128(data, pos)
                            pos += kb
                        
                elif section_id == 3: # Function Section
                    num_funcs, kb = self._read_leb128(data, pos)
                    function_count = num_funcs
                    
                elif section_id == 7: # Export Section
                    export_section_offset = section_start
                    # We'll parse this later once we have code offsets
                    pass
                    
                elif section_id == 10: # Code Section
                    code_section_offset = section_start
                    
                pos = section_end
                
            except IndexError:
                # End of valid data (padding?)
                break
        
        # Now pass 2: Parse Code section to get offsets
        func_offsets = [] 
        
        if code_section_offset > 0:
            try:
                pos = code_section_offset
                num_bodies, kb = self._read_leb128(data, pos)
                pos += kb
                
                for i in range(num_bodies):
                    body_len, kb = self._read_leb128(data, pos)
                    pos += kb
                    
                    body_start = pos # This points to local count
                    
                    # Skip locals declaration to find first opcode
                    try:
                        local_count, kb2 = self._read_leb128(data, pos)
                        pos += kb2
                        for _ in range(local_count):
                            # count
                            _, kb3 = self._read_leb128(data, pos) 
                            pos += kb3
                            # type
                            pos += 1
                        
                        code_start_pc = pos # First instruction
                        func_offsets.append(code_start_pc)
                    except IndexError:
                        pass # Malformed body or truncation
                    
                    # Move to next body
                    pos = body_start + body_len 
            except IndexError:
               pass
                
        # Pass 3: Parse Exports and map to PC
        if export_section_offset > 0:
            try:
                pos = export_section_offset
                num_exports, kb = self._read_leb128(data, pos)
                pos += kb
                
                for _ in range(num_exports):
                    # Name
                    name_len, kb = self._read_leb128(data, pos)
                    pos += kb
                    name = data[pos:pos+name_len].decode('utf-8')
                    pos += name_len
                    
                    # Kind
                    kind = data[pos]
                    pos += 1
                    
                    # Index
                    index, kb = self._read_leb128(data, pos)
                    pos += kb
                    
                    if kind == 0: # Function export
                        # Normalize index (subtract imports)
                        internal_index = index - import_count
                        if 0 <= internal_index < len(func_offsets):
                            exports[name] = func_offsets[internal_index]
            except IndexError:
                pass
        
        return exports

    def _read_leb128(self, data: bytes, offset: int) -> Tuple[int, int]:
        """Read LEB128 unsigned integer. Returns (value, bytes_read)."""
        result = 0
        shift = 0
        count = 0
        while True:
            if offset + count >= len(data):
                raise IndexError("Unexpected EOF reading LEB128")
                
            byte = data[offset + count]
            count += 1
            result |= (byte & 0x7f) << shift
            shift += 7
            if (byte & 0x80) == 0:
                break
        return result, count

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("file", help="Input .rts.png or .wasm file")
    args = parser.parse_args()
    
    extractor = WASMExtractor()
    if args.file.endswith(".png"):
        data = extractor.extract_from_file(args.file)
        print(f"Extracted {len(data)} bytes of WASM")
    else:
        with open(args.file, "rb") as f:
            data = f.read()
            
    exports = extractor._parse_wasm_exports(data)
    print("Exports found:")
    for name, pc in exports.items():
        print(f"  {name}: PC={pc}")
