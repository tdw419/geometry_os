#!/usr/bin/env python3
"""
Memory Profiler for Geometry OS Hypervisor Module

This script profiles memory usage and identifies potential leaks in:
- GPU memory pools
- Shared memory regions
- Pipeline caches
- Rust allocations via FFI

Usage:
    python memory_profiler.py [--duration SECONDS] [--interval MS]
"""

import argparse
import subprocess
import time
import json
import os
import sys
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Any, Optional
import threading
import signal


class MemorySnapshot:
    """Represents a memory usage snapshot at a point in time."""
    
    def __init__(self, timestamp: float):
        self.timestamp = timestamp
        self.process_memory = self._get_process_memory()
        self.gpu_memory = self._get_gpu_memory()
        self.shared_memory = self._get_shared_memory()
        self.system_memory = self._get_system_memory()
    
    def _get_process_memory(self) -> Dict[str, int]:
        """Get process memory statistics."""
        try:
            pid = os.getpid()
            with open(f'/proc/{pid}/status', 'r') as f:
                status = f.read()
            
            # Parse memory fields
            result = {}
            for line in status.split('\n'):
                if line.startswith('VmRSS:'):
                    result['rss_kb'] = int(line.split()[1])
                elif line.startswith('VmSize:'):
                    result['vms_kb'] = int(line.split()[1])
                elif line.startswith('VmData:'):
                    result['data_kb'] = int(line.split()[1])
                elif line.startswith('VmStk:'):
                    result['stack_kb'] = int(line.split()[1])
            
            return result
        except Exception as e:
            print(f"Warning: Could not read process memory: {e}", file=sys.stderr)
            return {}
    
    def _get_gpu_memory(self) -> Dict[str, Any]:
        """Get GPU memory statistics."""
        try:
            # Try nvidia-smi for NVIDIA GPUs
            result = subprocess.run(
                ['nvidia-smi', '--query-gpu=memory.used,memory.total,memory.free', '--format=csv,noheader,nounits'],
                capture_output=True,
                text=True,
                timeout=5
            )
            
            if result.returncode == 0:
                gpus = []
                for line in result.stdout.strip().split('\n'):
                    used, total, free = [int(x.strip()) for x in line.split(',')]
                    gpus.append({
                        'used_mb': used,
                        'total_mb': total,
                        'free_mb': free,
                        'utilization': (used / total * 100) if total > 0 else 0
                    })
                return {'gpus': gpus, 'vendor': 'nvidia'}
            
            # Try AMD GPU stats
            result = subprocess.run(
                ['rocm-smi', '--showmeminfo', 'vram', '--json'],
                capture_output=True,
                text=True,
                timeout=5
            )
            
            if result.returncode == 0:
                data = json.loads(result.stdout)
                return {'gpus': data, 'vendor': 'amd'}
            
            return {'available': False}
        except Exception as e:
            print(f"Warning: Could not query GPU memory: {e}", file=sys.stderr)
            return {'available': False, 'error': str(e)}
    
    def _get_shared_memory(self) -> Dict[str, Any]:
        """Get shared memory statistics."""
        try:
            shm_path = Path('/dev/shm')
            geometry_os_shm = list(shm_path.glob('geometry_os_*'))
            
            total_size = 0
            files = []
            for shm_file in geometry_os_shm:
                size = shm_file.stat().st_size
                total_size += size
                files.append({
                    'name': shm_file.name,
                    'size_bytes': size,
                    'size_mb': size / (1024 * 1024)
                })
            
            return {
                'total_mb': total_size / (1024 * 1024),
                'file_count': len(files),
                'files': files
            }
        except Exception as e:
            print(f"Warning: Could not read shared memory: {e}", file=sys.stderr)
            return {}
    
    def _get_system_memory(self) -> Dict[str, int]:
        """Get system-wide memory statistics."""
        try:
            with open('/proc/meminfo', 'r') as f:
                meminfo = f.read()
            
            result = {}
            for line in meminfo.split('\n'):
                parts = line.split()
                if len(parts) >= 2:
                    key = parts[0].rstrip(':')
                    value = int(parts[1])
                    
                    if key == 'MemTotal':
                        result['total_kb'] = value
                    elif key == 'MemFree':
                        result['free_kb'] = value
                    elif key == 'MemAvailable':
                        result['available_kb'] = value
                    elif key == 'Buffers':
                        result['buffers_kb'] = value
                    elif key == 'Cached':
                        result['cached_kb'] = value
                    elif key == 'Shmem':
                        result['shared_kb'] = value
            
            # Calculate used memory
            if 'total_kb' in result and 'available_kb' in result:
                result['used_kb'] = result['total_kb'] - result['available_kb']
                result['utilization'] = (result['used_kb'] / result['total_kb'] * 100)
            
            return result
        except Exception as e:
            print(f"Warning: Could not read system memory: {e}", file=sys.stderr)
            return {}
    
    def to_dict(self) -> Dict[str, Any]:
        """Convert snapshot to dictionary."""
        return {
            'timestamp': self.timestamp,
            'process': self.process_memory,
            'gpu': self.gpu_memory,
            'shared_memory': self.shared_memory,
            'system': self.system_memory
        }


class MemoryProfiler:
    """Main memory profiler for hypervisor module."""
    
    def __init__(self, interval_ms: int = 1000):
        self.interval = interval_ms / 1000.0
        self.snapshots: List[MemorySnapshot] = []
        self.running = False
        self.profiling_thread: Optional[threading.Thread] = None
        self.lock = threading.Lock()
    
    def start(self):
        """Start profiling in background thread."""
        if self.running:
            print("Profiler already running", file=sys.stderr)
            return
        
        self.running = True
        self.profiling_thread = threading.Thread(target=self._profile_loop, daemon=True)
        self.profiling_thread.start()
        print(f"Memory profiler started (interval: {self.interval}s)")
    
    def stop(self) -> List[MemorySnapshot]:
        """Stop profiling and return snapshots."""
        if not self.running:
            print("Profiler not running", file=sys.stderr)
            return []
        
        self.running = False
        if self.profiling_thread:
            self.profiling_thread.join(timeout=5)
        
        print(f"Memory profiler stopped. Captured {len(self.snapshots)} snapshots")
        return self.snapshots
    
    def _profile_loop(self):
        """Main profiling loop."""
        while self.running:
            snapshot = MemorySnapshot(time.time())
            with self.lock:
                self.snapshots.append(snapshot)
            time.sleep(self.interval)
    
    def analyze(self) -> Dict[str, Any]:
        """Analyze memory usage patterns and detect leaks."""
        if len(self.snapshots) < 2:
            return {'error': 'Not enough snapshots for analysis'}
        
        with self.lock:
            snapshots = self.snapshots.copy()
        
        analysis = {
            'duration_seconds': snapshots[-1].timestamp - snapshots[0].timestamp,
            'snapshot_count': len(snapshots),
            'process_memory': self._analyze_process_memory(snapshots),
            'gpu_memory': self._analyze_gpu_memory(snapshots),
            'shared_memory': self._analyze_shared_memory(snapshots),
            'leak_indicators': []
        }
        
        # Detect leak indicators
        if analysis['process_memory']['growth_rate_kb_per_sec'] > 100:
            analysis['leak_indicators'].append({
                'type': 'process_memory_growth',
                'severity': 'high',
                'rate': f"{analysis['process_memory']['growth_rate_kb_per_sec']:.2f} KB/s"
            })
        
        if analysis['shared_memory']['file_growth'] > 0:
            analysis['leak_indicators'].append({
                'type': 'shared_memory_accumulation',
                'severity': 'medium',
                'files_added': analysis['shared_memory']['file_growth']
            })
        
        if analysis['gpu_memory']['growth_mb'] > 100:
            analysis['leak_indicators'].append({
                'type': 'gpu_memory_growth',
                'severity': 'high',
                'growth': f"{analysis['gpu_memory']['growth_mb']:.2f} MB"
            })
        
        return analysis
    
    def _analyze_process_memory(self, snapshots: List[MemorySnapshot]) -> Dict[str, Any]:
        """Analyze process memory trends."""
        rss_values = [s.process_memory.get('rss_kb', 0) for s in snapshots]
        
        if not rss_values:
            return {}
        
        growth = rss_values[-1] - rss_values[0]
        duration = snapshots[-1].timestamp - snapshots[0].timestamp
        growth_rate = growth / duration if duration > 0 else 0
        
        return {
            'initial_rss_kb': rss_values[0],
            'final_rss_kb': rss_values[-1],
            'growth_kb': growth,
            'growth_rate_kb_per_sec': growth_rate,
            'peak_rss_kb': max(rss_values),
            'average_rss_kb': sum(rss_values) / len(rss_values)
        }
    
    def _analyze_gpu_memory(self, snapshots: List[MemorySnapshot]) -> Dict[str, Any]:
        """Analyze GPU memory trends."""
        gpu_snapshots = [s.gpu_memory for s in snapshots if s.gpu_memory.get('available', True)]
        
        if not gpu_snapshots or 'gpus' not in gpu_snapshots[0]:
            return {'available': False}
        
        # Analyze first GPU (multi-GPU support can be added)
        first_gpu_data = [s['gpus'][0] if isinstance(s.get('gpus'), list) and s['gpus'] else {} 
                         for s in gpu_snapshots]
        
        used_values = [g.get('used_mb', 0) for g in first_gpu_data]
        
        if not used_values:
            return {'available': False}
        
        growth = used_values[-1] - used_values[0]
        
        return {
            'available': True,
            'initial_mb': used_values[0],
            'final_mb': used_values[-1],
            'growth_mb': growth,
            'peak_mb': max(used_values),
            'average_mb': sum(used_values) / len(used_values)
        }
    
    def _analyze_shared_memory(self, snapshots: List[MemorySnapshot]) -> Dict[str, Any]:
        """Analyze shared memory trends."""
        shm_snapshots = [s.shared_memory for s in snapshots if s.shared_memory]
        
        if not shm_snapshots:
            return {}
        
        file_counts = [s.get('file_count', 0) for s in shm_snapshots]
        total_sizes = [s.get('total_mb', 0) for s in shm_snapshots]
        
        return {
            'initial_file_count': file_counts[0] if file_counts else 0,
            'final_file_count': file_counts[-1] if file_counts else 0,
            'file_growth': file_counts[-1] - file_counts[0] if file_counts else 0,
            'initial_total_mb': total_sizes[0] if total_sizes else 0,
            'final_total_mb': total_sizes[-1] if total_sizes else 0,
            'size_growth_mb': total_sizes[-1] - total_sizes[0] if total_sizes else 0
        }
    
    def generate_report(self, output_path: str):
        """Generate a detailed report."""
        analysis = self.analyze()
        
        report = {
            'metadata': {
                'generated_at': datetime.now().isoformat(),
                'profiler_version': '1.0.0',
                'snapshot_count': len(self.snapshots)
            },
            'analysis': analysis,
            'recommendations': self._generate_recommendations(analysis),
            'snapshots': [s.to_dict() for s in self.snapshots[-10:]]  # Last 10 snapshots
        }
        
        with open(output_path, 'w') as f:
            json.dump(report, f, indent=2)
        
        print(f"Report generated: {output_path}")
    
    def _generate_recommendations(self, analysis: Dict[str, Any]) -> List[Dict[str, str]]:
        """Generate optimization recommendations based on analysis."""
        recommendations = []
        
        for indicator in analysis.get('leak_indicators', []):
            if indicator['type'] == 'process_memory_growth':
                recommendations.append({
                    'priority': 'high',
                    'category': 'memory_leak',
                    'description': 'Process memory is growing continuously',
                    'action': 'Check for unbounded collections, missing deallocations, or circular references',
                    'details': f"Growth rate: {indicator['rate']}"
                })
            
            elif indicator['type'] == 'shared_memory_accumulation':
                recommendations.append({
                    'priority': 'medium',
                    'category': 'resource_leak',
                    'description': 'Shared memory files are accumulating',
                    'action': 'Ensure Drop implementations are cleaning up /dev/shm files',
                    'details': f"Files added during profiling: {indicator['files_added']}"
                })
            
            elif indicator['type'] == 'gpu_memory_growth':
                recommendations.append({
                    'priority': 'high',
                    'category': 'gpu_leak',
                    'description': 'GPU memory usage is growing',
                    'action': 'Review GPU buffer/texture deallocation, check pipeline cache eviction',
                    'details': f"Memory growth: {indicator['growth']}"
                })
        
        # Check fragmentation
        if 'process_memory' in analysis:
            if analysis['process_memory'].get('growth_rate_kb_per_sec', 0) > 50:
                recommendations.append({
                    'priority': 'medium',
                    'category': 'fragmentation',
                    'description': 'Memory growth may indicate fragmentation',
                    'action': 'Consider implementing or tuning memory defragmentation',
                    'details': 'Review buddy allocator and memory pool metrics'
                })
        
        return recommendations


def main():
    parser = argparse.ArgumentParser(
        description='Profile memory usage in Geometry OS Hypervisor'
    )
    parser.add_argument(
        '--duration',
        type=int,
        default=60,
        help='Profiling duration in seconds (default: 60)'
    )
    parser.add_argument(
        '--interval',
        type=int,
        default=1000,
        help='Sampling interval in milliseconds (default: 1000)'
    )
    parser.add_argument(
        '--output',
        type=str,
        default='hypervisor_memory_profile.json',
        help='Output report file (default: hypervisor_memory_profile.json)'
    )
    parser.add_argument(
        '--continuous',
        action='store_true',
        help='Run continuously until interrupted'
    )
    
    args = parser.parse_args()
    
    profiler = MemoryProfiler(interval_ms=args.interval)
    
    # Handle Ctrl+C gracefully
    def signal_handler(sig, frame):
        print("\nStopping profiler...")
        snapshots = profiler.stop()
        profiler.generate_report(args.output)
        sys.exit(0)
    
    signal.signal(signal.SIGINT, signal_handler)
    
    profiler.start()
    
    if args.continuous:
        print("Running continuously. Press Ctrl+C to stop and generate report.")
        while True:
            time.sleep(1)
    else:
        print(f"Profiling for {args.duration} seconds...")
        time.sleep(args.duration)
        profiler.stop()
        profiler.generate_report(args.output)
        
        # Print summary
        analysis = profiler.analyze()
        print("\n=== Memory Profile Summary ===")
        print(f"Duration: {analysis['duration_seconds']:.1f}s")
        print(f"Snapshots: {analysis['snapshot_count']}")
        
        if 'process_memory' in analysis:
            pm = analysis['process_memory']
            print(f"\nProcess Memory:")
            print(f"  Initial: {pm.get('initial_rss_kb', 0) / 1024:.1f} MB")
            print(f"  Final: {pm.get('final_rss_kb', 0) / 1024:.1f} MB")
            print(f"  Growth: {pm.get('growth_kb', 0) / 1024:.1f} MB")
            print(f"  Rate: {pm.get('growth_rate_kb_per_sec', 0):.2f} KB/s")
        
        if analysis.get('leak_indicators'):
            print(f"\n⚠️  Leak Indicators:")
            for indicator in analysis['leak_indicators']:
                print(f"  - {indicator['type']}: {indicator['severity']} ({indicator.get('rate', indicator.get('growth', 'N/A'))})")


if __name__ == '__main__':
    main()
