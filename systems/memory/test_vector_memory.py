#!/usr/bin/env python3
"""
Test Script for Vector Memory Daemon
=====================================

Tests the PostgreSQL + pgvector integration for storing and retrieving thought pixels.
"""

import asyncio
import json
import os
import socket
import time
import numpy as np
from typing import List, Dict
from pathlib import Path

# Add project root to path
project_root = Path(__file__).parent.parent.parent
import sys
sys.path.insert(0, str(project_root))

from systems.memory.vector_memory_daemon import VectorMemoryAgent, ThoughtPixel


class VectorMemoryTester:
    """Test suite for Vector Memory Daemon"""
    
    def __init__(self, db_url: str = "postgresql://geometry_os:geometry_os@localhost/geometry_os"):
        self.db_url = db_url
        self.agent = None
        self.test_results = []
    
    async def setup(self):
        """Setup test environment"""
        print("🔧 Setting up test environment...")
        
        self.agent = VectorMemoryAgent(db_url=self.db_url)
        
        if not self.agent.connect():
            print("❌ Failed to connect to database")
            return False
        
        print("✅ Test environment ready")
        return True
    
    def test_store_thought(self) -> bool:
        """Test storing a single thought pixel"""
        print("\n📝 Test 1: Store Thought Pixel")
        
        try:
            thought = ThoughtPixel(
                token_id=1,
                token="test",
                embedding=np.random.rand(1536),
                hilbert_x=0.5,
                hilbert_y=0.5,
                layer=0,
                activation=1.0,
                session_id="test_session",
                timestamp=time.time()
            )
            
            success = self.agent.store_thought(thought)
            
            if success:
                print("✅ Thought stored successfully")
                self.test_results.append(("Store Thought", True))
                return True
            else:
                print("❌ Failed to store thought")
                self.test_results.append(("Store Thought", False))
                return False
                
        except Exception as e:
            print(f"❌ Test failed with error: {e}")
            self.test_results.append(("Store Thought", False))
            return False
    
    def test_store_batch(self) -> bool:
        """Test storing multiple thought pixels"""
        print("\n📝 Test 2: Store Batch of Thoughts")
        
        try:
            batch_size = 100
            start_time = time.time()
            
            for i in range(batch_size):
                thought = ThoughtPixel(
                    token_id=i,
                    token=f"token_{i}",
                    embedding=np.random.rand(1536),
                    hilbert_x=np.random.rand(),
                    hilbert_y=np.random.rand(),
                    layer=i % 10,
                    activation=np.random.rand(),
                    session_id="test_session_batch",
                    timestamp=time.time()
                )
                
                if not self.agent.store_thought(thought):
                    raise Exception(f"Failed to store thought {i}")
            
            elapsed = time.time() - start_time
            throughput = batch_size / elapsed
            
            print(f"✅ Stored {batch_size} thoughts in {elapsed:.2f}s")
            print(f"✅ Throughput: {throughput:.2f} thoughts/second")
            self.test_results.append(("Store Batch", True))
            return True
            
        except Exception as e:
            print(f"❌ Test failed with error: {e}")
            self.test_results.append(("Store Batch", False))
            return False
    
    def test_recall_semantic_neighborhood(self) -> bool:
        """Test recalling semantic neighborhood"""
        print("\n📝 Test 3: Recall Semantic Neighborhood")
        
        try:
            # Create a query vector
            query_vector = np.random.rand(1536)
            
            # Recall memories
            start_time = time.time()
            memories = self.agent.recall_semantic_neighborhood(
                query_vector=query_vector,
                limit=10,
                threshold=0.0
            )
            elapsed = time.time() - start_time
            
            print(f"✅ Retrieved {len(memories)} memories in {elapsed*1000:.2f}ms")
            
            if elapsed > 0.05:
                print(f"⚠️  Warning: Retrieval took {elapsed*1000:.2f}ms (target: <50ms)")
            
            # Print sample memories
            if memories:
                print(f"✅ Sample memory: {memories[0]['token']} (similarity: {memories[0]['similarity']:.3f})")
            
            self.test_results.append(("Recall Semantic Neighborhood", True))
            return True
            
        except Exception as e:
            print(f"❌ Test failed with error: {e}")
            self.test_results.append(("Recall Semantic Neighborhood", False))
            return False
    
    def test_get_memory_beam(self) -> bool:
        """Test getting memory beam for visualization"""
        print("\n📝 Test 4: Get Memory Beam")
        
        try:
            query_vector = np.random.rand(1536)
            current_x = 0.5
            current_y = 0.5
            
            start_time = time.time()
            beam = self.agent.get_memory_beam(
                query_vector=query_vector,
                current_x=current_x,
                current_y=current_y,
                limit=20
            )
            elapsed = time.time() - start_time
            
            print(f"✅ Retrieved memory beam with {len(beam)} memories in {elapsed*1000:.2f}ms")
            
            if beam:
                print(f"✅ Top memory: {beam[0]['token']} (similarity: {beam[0]['similarity']:.3f}, spatial_distance: {beam[0]['spatial_distance']:.3f})")
            
            self.test_results.append(("Get Memory Beam", True))
            return True
            
        except Exception as e:
            print(f"❌ Test failed with error: {e}")
            self.test_results.append(("Get Memory Beam", False))
            return False
    
    def test_session_stats(self) -> bool:
        """Test getting session statistics"""
        print("\n📝 Test 5: Get Session Stats")
        
        try:
            stats = self.agent.get_session_stats("test_session_batch")
            
            print(f"✅ Session: {stats['session_id']}")
            print(f"✅ Total thoughts: {stats['total_thoughts']}")
            print(f"✅ Average activation: {stats['avg_activation']:.3f}")
            print(f"✅ Duration: {stats['duration']:.2f}s")
            
            self.test_results.append(("Get Session Stats", True))
            return True
            
        except Exception as e:
            print(f"❌ Test failed with error: {e}")
            self.test_results.append(("Get Session Stats", False))
            return False
    
    def test_performance_benchmark(self) -> bool:
        """Test performance with large dataset"""
        print("\n📝 Test 6: Performance Benchmark")
        
        try:
            # Store 1000 thoughts
            print("📊 Storing 1000 thoughts...")
            batch_size = 1000
            start_time = time.time()
            
            for i in range(batch_size):
                thought = ThoughtPixel(
                    token_id=i + 1000,
                    token=f"perf_token_{i}",
                    embedding=np.random.rand(1536),
                    hilbert_x=np.random.rand(),
                    hilbert_y=np.random.rand(),
                    layer=i % 10,
                    activation=np.random.rand(),
                    session_id="perf_test",
                    timestamp=time.time()
                )
                
                self.agent.store_thought(thought)
            
            store_time = time.time() - start_time
            print(f"✅ Stored {batch_size} thoughts in {store_time:.2f}s")
            print(f"✅ Store throughput: {batch_size/store_time:.2f} thoughts/second")
            
            # Test retrieval performance
            print("\n📊 Testing retrieval performance...")
            query_times = []
            
            for i in range(100):
                query_vector = np.random.rand(1536)
                start_time = time.time()
                
                memories = self.agent.recall_semantic_neighborhood(
                    query_vector=query_vector,
                    limit=10
                )
                
                query_time = time.time() - start_time
                query_times.append(query_time)
            
            avg_query_time = np.mean(query_times)
            p95_query_time = np.percentile(query_times, 95)
            p99_query_time = np.percentile(query_times, 99)
            
            print(f"✅ Average query time: {avg_query_time*1000:.2f}ms")
            print(f"✅ P95 query time: {p95_query_time*1000:.2f}ms")
            print(f"✅ P99 query time: {p99_query_time*1000:.2f}ms")
            
            if avg_query_time > 0.05:
                print(f"⚠️  Warning: Average query time exceeds 50ms target")
            
            self.test_results.append(("Performance Benchmark", True))
            return True
            
        except Exception as e:
            print(f"❌ Test failed with error: {e}")
            self.test_results.append(("Performance Benchmark", False))
            return False
    
    def print_summary(self):
        """Print test summary"""
        print("\n" + "="*60)
        print("📊 TEST SUMMARY")
        print("="*60)
        
        passed = sum(1 for _, result in self.test_results if result)
        total = len(self.test_results)
        
        for test_name, result in self.test_results:
            status = "✅ PASS" if result else "❌ FAIL"
            print(f"{status}: {test_name}")
        
        print("="*60)
        print(f"Total: {passed}/{total} tests passed")
        print(f"Success Rate: {passed/total*100:.1f}%")
        print("="*60)
        
        if passed == total:
            print("🎉 All tests passed!")
        else:
            print(f"⚠️  {total - passed} test(s) failed")


async def main():
    """Main test runner"""
    import argparse
    
    parser = argparse.ArgumentParser(description='Test Vector Memory Daemon')
    parser.add_argument('--db-url', default='postgresql://geometry_os:geometry_os@localhost/geometry_os',
                        help='PostgreSQL connection URL')
    parser.add_argument('--quick', action='store_true',
                        help='Run quick tests only (skip performance benchmark)')
    
    args = parser.parse_args()
    
    tester = VectorMemoryTester(db_url=args.db_url)
    
    if not await tester.setup():
        print("❌ Failed to setup test environment")
        return
    
    # Run tests
    tester.test_store_thought()
    tester.test_store_batch()
    tester.test_recall_semantic_neighborhood()
    tester.test_get_memory_beam()
    tester.test_session_stats()
    
    if not args.quick:
        tester.test_performance_benchmark()
    
    # Print summary
    tester.print_summary()
    
    # Cleanup
    if tester.agent:
        tester.agent.stop()


if __name__ == '__main__':
    asyncio.run(main())
