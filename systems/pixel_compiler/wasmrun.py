
import argparse
import sys
from pathlib import Path

# Fix relative import when running as script
if __name__ == "__main__" and __package__ is None:
    # Add project root to path
    sys.path.append(str(Path(__file__).parent.parent.parent))
    __package__ = "systems.pixel_compiler"

from systems.pixel_compiler.wasm_runtime import WASMRuntime

def main():
    parser = argparse.ArgumentParser(description="Clean WASM Runner for PixelRTS")
    parser.add_argument("file", help="Input .rts.png file")
    parser.add_argument("--entry", help="Entry point function name", default=None)
    parser.add_argument("--instruction-limit", type=int, default=100000, help="Max instructions")
    parser.add_argument("--trace", action="store_true", help="Enable execution trace")
    
    args = parser.parse_args()
    
    if not Path(args.file).exists():
        print(f"Error: File {args.file} not found")
        sys.exit(1)
        
    try:
        runtime = WASMRuntime.from_png(args.file)
        runtime.max_instructions = args.instruction_limit
        
        if args.trace:
            runtime.bridge.enable_trace(True)
            
        if args.entry:
            print(f"Executing function '{args.entry}'...")
            result = runtime.call(args.entry)
        else:
            print("Executing default entry point...")
            # If no entry provided, try main, start, or 0
            if "main" in runtime.exports:
                result = runtime.call("main")
            elif "_start" in runtime.exports:
                result = runtime.call("_start")
            else:
                 # Default execution
                 res = runtime.bridge.execute(runtime.wasm_bytes, entry_point=0)
                 result = res.return_value

        print(f"Execution successful. Result: {result}")
        
    except Exception as e:
        print(f"Execution failed: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)

if __name__ == "__main__":
    main()
