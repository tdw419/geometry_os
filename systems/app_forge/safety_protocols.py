#!/usr/bin/env python3
"""
AI Safety Protocols for State Injection
Implements comprehensive safety mechanisms for AI-driven state manipulation.
"""

import sys
import os
import numpy as np
from typing import Dict, Any, List, Optional, Callable
from enum import Enum
import hashlib
import time

# Add parent directory to path for imports
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.dirname(__file__))))

class SafetyLevel(Enum):
    """Safety levels for different operations."""
    CRITICAL = 3      # Kernel, memory, security operations
    HIGH = 2          # System state, process management
    MEDIUM = 1        # App state, visual enhancements
    LOW = 0           # Cosmetic changes, non-critical operations

class SafetyProtocol:
    """
    Comprehensive safety protocols for AI-driven state injection.
    Implements multiple layers of protection including CTRM, rate limiting,
    and state validation.
    """
    
    def __init__(self):
        self.mutation_history: List[Dict] = []
        self.rate_limits: Dict[str, Dict] = {}
        self.safety_thresholds = {
            SafetyLevel.CRITICAL.value: 0.95,
            SafetyLevel.HIGH.value: 0.85,
            SafetyLevel.MEDIUM.value: 0.70,
            SafetyLevel.LOW.value: 0.50
        }
        
        # Initialize rate limits
        self._initialize_rate_limits()
        
        # State validation cache
        self.state_cache: Dict[str, Any] = {}
        
        print("🛡️  Safety Protocols Initialized")
    
    def _initialize_rate_limits(self):
        """Initialize rate limits for different mutation types."""
        self.rate_limits = {
            'critical': {'window': 60, 'max': 1, 'count': 0, 'last_reset': time.time()},
            'high': {'window': 30, 'max': 3, 'count': 0, 'last_reset': time.time()},
            'medium': {'window': 10, 'max': 10, 'count': 0, 'last_reset': time.time()},
            'low': {'window': 5, 'max': 20, 'count': 0, 'last_reset': time.time()}
        }
    
    def check_mutation_safety(self, mutation: Dict[str, Any]) -> bool:
        """
        Comprehensive safety check for mutations.
        
        Args:
            mutation: Mutation dictionary with all required fields
        
        Returns:
            bool: True if mutation is safe to apply
        """
        # 1. Validate mutation structure
        if not self._validate_mutation_structure(mutation):
            return False
        
        # 2. Check rate limits
        if not self._check_rate_limits(mutation):
            return False
        
        # 3. Validate confidence against safety level
        if not self._validate_confidence(mutation):
            return False
        
        # 4. Check for state consistency
        if not self._check_state_consistency(mutation):
            return False
        
        # 5. Apply CTRM (Critical Thought Reform Mechanism)
        if not self._apply_ctrm(mutation):
            return False
        
        return True
    
    def _validate_mutation_structure(self, mutation: Dict[str, Any]) -> bool:
        """Validate mutation has required structure."""
        required_fields = ['type', 'confidence', 'target', 'data', 'description', 'safety_level']
        
        for field in required_fields:
            if field not in mutation:
                print(f"❌ Missing required field: {field}")
                return False
        
        return True
    
    def _check_rate_limits(self, mutation: Dict[str, Any]) -> bool:
        """Check if mutation exceeds rate limits."""
        safety_level = mutation['safety_level']
        level_name = self._get_safety_level_name(safety_level)
        
        if level_name not in self.rate_limits:
            return True  # No rate limit for this level
        
        limit = self.rate_limits[level_name]
        current_time = time.time()
        
        # Reset counter if window has passed
        if current_time - limit['last_reset'] > limit['window']:
            limit['count'] = 0
            limit['last_reset'] = current_time
        
        # Check if limit exceeded
        if limit['count'] >= limit['max']:
            print(f"⏳ Rate limit exceeded for {level_name} mutations")
            print(f"   Limit: {limit['max']} per {limit['window']} seconds")
            return False
        
        # Increment counter
        limit['count'] += 1
        return True
    
    def _validate_confidence(self, mutation: Dict[str, Any]) -> bool:
        """Validate confidence meets safety level requirements."""
        safety_level = mutation['safety_level']
        confidence = mutation['confidence']
        
        if safety_level not in self.safety_thresholds:
            print(f"❌ Unknown safety level: {safety_level}")
            return False
        
        required_confidence = self.safety_thresholds[safety_level]
        
        if confidence < required_confidence:
            level_name = self._get_safety_level_name(safety_level)
            print(f"🔒 Insufficient confidence for {level_name} operation")
            print(f"   Required: {required_confidence}, Got: {confidence}")
            return False
        
        return True
    
    def _check_state_consistency(self, mutation: Dict[str, Any]) -> bool:
        """Check mutation for state consistency and validity."""
        mutation_type = mutation['type']
        data = mutation['data']
        
        # For state modifications, check if state is valid
        if mutation_type == 'state_modification':
            if not self._validate_state_data(data):
                print("❌ Invalid state data in mutation")
                return False
        
        # Check for suspicious patterns
        if self._contains_suspicious_patterns(data):
            print("🚨 Suspicious patterns detected in mutation data")
            return False
        
        return True
    
    def _validate_state_data(self, state_data: Dict[str, Any]) -> bool:
        """Validate state data structure and content."""
        # Check for reasonable array sizes
        if 'char_grid' in state_data:
            grid = state_data['char_grid']
            if isinstance(grid, np.ndarray):
                if grid.ndim != 2 or grid.size > 10000:  # Reasonable limit
                    print(f"❌ Unreasonable grid size: {grid.shape}")
                    return False
        
        # Check for valid character content
        if 'char_grid' in state_data:
            grid = state_data['char_grid']
            # Check for control characters that could be malicious
            if isinstance(grid, np.ndarray):
                for char in np.unique(grid):
                    if isinstance(char, str) and len(char) > 0:
                        code = ord(char[0])
                        if code < 32 and char not in ['\n', '\r', '\t']:
                            print(f"❌ Invalid control character detected: {repr(char)}")
                            return False
        
        return True
    
    def _contains_suspicious_patterns(self, data: Any) -> bool:
        """Check for suspicious patterns in mutation data."""
        suspicious_patterns = [
            'rm -rf', 'dd if=', 'mkfs', 'shutdown', 'reboot',
            '/dev/sd', 'password', 'sudo ', 'root:',
            'eval(', 'exec(', 'os.system', 'subprocess.run'
        ]
        
        data_str = str(data).lower()
        
        for pattern in suspicious_patterns:
            if pattern in data_str:
                print(f"🚨 Suspicious pattern detected: {pattern}")
                return True
        
        return False
    
    def _apply_ctrm(self, mutation: Dict[str, Any]) -> bool:
        """
        Critical Thought Reform Mechanism.
        Final safety check before allowing mutation.
        """
        # Check for hallucination patterns
        if self._detect_hallucination(mutation):
            print("🤖 Potential AI hallucination detected")
            return False
        
        # Check mutation history for similar failed attempts
        if self._check_mutation_history(mutation):
            print("🔄 Similar mutation recently failed")
            return False
        
        # All checks passed
        return True
    
    def _detect_hallucination(self, mutation: Dict[str, Any]) -> bool:
        """Detect potential AI hallucinations in mutations."""
        description = mutation.get('description', '').lower()
        
        # Common hallucination indicators
        hallucination_indicators = [
            'i think', 'maybe', 'perhaps', 'not sure',
            'might be', 'could be', 'possibly', 'probably'
        ]
        
        for indicator in hallucination_indicators:
            if indicator in description:
                return True
        
        # Check for unreasonable confidence
        if mutation['confidence'] > 0.99:
            # Perfect confidence is often a hallucination indicator
            return True
        
        return False
    
    def _check_mutation_history(self, mutation: Dict[str, Any]) -> bool:
        """Check if similar mutations have recently failed."""
        current_hash = self._hash_mutation(mutation)
        
        # Check last 10 mutations
        recent_mutations = self.mutation_history[-10:]
        
        for recent in recent_mutations:
            if not recent['success']:
                # Calculate similarity
                similarity = self._calculate_mutation_similarity(recent['mutation'], mutation)
                if similarity > 0.8:  # 80% similar
                    return True
        
        return False
    
    def _calculate_mutation_similarity(self, mut1: Dict, mut2: Dict) -> float:
        """Calculate similarity between two mutations."""
        # Simple similarity based on type, target, and description
        similarity = 0.0
        
        if mut1['type'] == mut2['type']:
            similarity += 0.3
        
        if mut1['target'] == mut2['target']:
            similarity += 0.3
        
        # Compare descriptions
        desc1 = mut1.get('description', '')
        desc2 = mut2.get('description', '')
        if desc1 and desc2:
            # Simple token matching
            tokens1 = set(desc1.lower().split())
            tokens2 = set(desc2.lower().split())
            common = tokens1.intersection(tokens2)
            similarity += min(0.4, len(common) / max(len(tokens1), len(tokens2), 1))
        
        return similarity
    
    def log_mutation_result(self, mutation: Dict[str, Any], success: bool):
        """Log mutation result for future analysis."""
        log_entry = {
            'timestamp': self._get_current_timestamp(),
            'mutation': mutation.copy(),
            'success': success,
            'hash': self._hash_mutation(mutation)
        }
        
        self.mutation_history.append(log_entry)
        
        # Keep history size manageable
        if len(self.mutation_history) > 1000:
            self.mutation_history = self.mutation_history[-1000:]
    
    def _hash_mutation(self, mutation: Dict[str, Any]) -> str:
        """Create hash of mutation for tracking."""
        # Create a stable hash based on key mutation properties
        key_data = {
            'type': mutation['type'],
            'target': mutation['target'],
            'description': mutation.get('description', ''),
            'safety_level': mutation['safety_level']
        }
        
        data_str = str(key_data).encode()
        return hashlib.md5(data_str).hexdigest()
    
    def _get_safety_level_name(self, safety_level: int) -> str:
        """Get name for safety level."""
        for level in SafetyLevel:
            if level.value == safety_level:
                return level.name.lower()
        return 'unknown'
    
    def _get_current_timestamp(self) -> str:
        """Get current timestamp."""
        import datetime
        return datetime.datetime.now().isoformat()
    
    def get_safety_report(self) -> Dict[str, Any]:
        """Generate safety report."""
        return {
            'total_mutations': len(self.mutation_history),
            'success_rate': self._calculate_success_rate(),
            'recent_failures': self._get_recent_failures(),
            'rate_limit_status': self._get_rate_limit_status(),
            'safety_thresholds': self.safety_thresholds
        }
    
    def _calculate_success_rate(self) -> float:
        """Calculate mutation success rate."""
        if not self.mutation_history:
            return 1.0
        
        successful = sum(1 for entry in self.mutation_history if entry['success'])
        return successful / len(self.mutation_history)
    
    def _get_recent_failures(self) -> List[Dict]:
        """Get recent failed mutations."""
        failures = [entry for entry in self.mutation_history[-20:] if not entry['success']]
        return [{
            'timestamp': entry['timestamp'],
            'type': entry['mutation']['type'],
            'target': entry['mutation']['target'],
            'reason': 'Unknown'  # Would be enhanced with specific reasons
        } for entry in failures]
    
    def _get_rate_limit_status(self) -> Dict[str, Any]:
        """Get current rate limit status."""
        return {
            level: {
                'count': info['count'],
                'max': info['max'],
                'window': info['window']
            } for level, info in self.rate_limits.items()
        }

# Enhanced mutation interface with safety protocols
def test_safety_protocols():
    """Test the safety protocols."""
    print("🛡️  Testing Safety Protocols...")
    
    # Create safety protocols instance
    safety = SafetyProtocol()
    
    # Test 1: Valid high-confidence mutation
    print("\n1. Testing valid high-confidence mutation...")
    valid_mutation = {
        'type': 'state_modification',
        'confidence': 0.90,
        'target': 'terminal_display',
        'data': {'char_grid': np.full((10, 10), ' ', dtype='<U1')},
        'description': 'AI enhancing terminal display',
        'safety_level': SafetyLevel.MEDIUM.value
    }
    
    result = safety.check_mutation_safety(valid_mutation)
    print(f"   Result: {'✅ Safe' if result else '❌ Unsafe'}")
    
    # Test 2: Low confidence critical mutation
    print("\n2. Testing low confidence critical mutation...")
    critical_mutation = {
        'type': 'state_modification',
        'confidence': 0.60,
        'target': 'kernel_memory',
        'data': {'critical': 'data'},
        'description': 'AI attempting kernel modification',
        'safety_level': SafetyLevel.CRITICAL.value
    }
    
    result = safety.check_mutation_safety(critical_mutation)
    print(f"   Result: {'✅ Safe' if result else '❌ Unsafe (Expected)'}")
    
    # Test 3: Suspicious pattern detection
    print("\n3. Testing suspicious pattern detection...")
    suspicious_mutation = {
        'type': 'input_injection',
        'confidence': 0.80,
        'target': 'terminal_input',
        'data': {'command': 'rm -rf /'},
        'description': 'AI injecting dangerous command',
        'safety_level': SafetyLevel.HIGH.value
    }
    
    result = safety.check_mutation_safety(suspicious_mutation)
    print(f"   Result: {'✅ Safe' if result else '❌ Unsafe (Expected)'}")
    
    # Test 4: Rate limit testing
    print("\n4. Testing rate limits...")
    for i in range(5):
        rate_test_mutation = {
            'type': 'visual_enhancement',
            'confidence': 0.60,
            'target': 'display',
            'data': {'text': f'Test {i}'},
            'description': f'AI visual enhancement {i}',
            'safety_level': SafetyLevel.LOW.value
        }
        
        result = safety.check_mutation_safety(rate_test_mutation)
        if result:
            print(f"   Mutation {i}: ✅ Allowed")
        else:
            print(f"   Mutation {i}: ❌ Rate limited")
    
    # Test 5: Safety report
    print("\n5. Safety Report:")
    report = safety.get_safety_report()
    print(f"   Total mutations checked: {report['total_mutations']}")
    print(f"   Success rate: {report['success_rate']:.1%}")
    print(f"   Recent failures: {len(report['recent_failures'])}")
    
    print(f"\n✅ Safety Protocols Test Complete!")
    print(f"   Protocols provide multi-layered protection:")
    print(f"   • Structural validation")
    print(f"   • Rate limiting")
    print(f"   • Confidence thresholds")
    print(f"   • State consistency checks")
    print(f"   • CTRM (Critical Thought Reform Mechanism)")
    print(f"   • Hallucination detection")
    print(f"   • Historical pattern analysis")

if __name__ == "__main__":
    test_safety_protocols()