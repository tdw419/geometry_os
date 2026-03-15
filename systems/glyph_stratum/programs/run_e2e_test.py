import subprocess
import time
import requests
import os

def run():
    print("=== Starting Ouroboros End-to-End Test ===")
    
    # 1. Compile telemetry test
    print("[1/4] Compiling telemetry_test.glyph...")
    subprocess.run(["python3", "systems/glyph_stratum/programs/compile_glyph.py", 
                    "systems/glyph_stratum/programs/telemetry_test.glyph", "/tmp/test.rts.png"], check=True)
    
    # 2. Start Daemon
    print("[2/4] Starting Daemon...")
    daemon = subprocess.Popen(["./target/release/gpu_dev_daemon"], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    time.sleep(15)
    
    try:
        # 3. Load program
        print("[3/4] Loading test.rts.png...")
        res = requests.post("http://127.0.0.1:8769/load", data="/tmp/test.rts.png", timeout=5)
        print(f"Load Response: {res.text}")
        
        # 4. Peek
        print("[4/4] Peeking at Hilbert 0x14000...")
        time.sleep(2)
        res = requests.get("http://127.0.0.1:8769/peek?addr=0x14000&size=4", timeout=5)
        print(f"PEEK RESULT: {res.text}")
        
    finally:
        daemon.terminate()
        print("=== Test Finished ===")

if __name__ == "__main__":
    run()
