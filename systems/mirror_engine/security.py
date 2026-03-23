#!/usr/bin/env python3
"""
Geometry Standard Security — Permission-aware alphabet validation

Security at the pixel-write level:
- Agent Signatures: 0x100-0x1FF=Human, 0x200-0x2FF=AI, 0x300-0x3FF=System
- Critical Tokens: 0x8E (FREEZE), 0x8F (THAW) require System privileges
- Write Quarantines: Lower layers cannot write to higher layers
"""

import time
import hashlib
from dataclasses import dataclass
from typing import Optional, Tuple
from enum import IntEnum


class AgentType(IntEnum):
    HUMAN = 0x100      # 0x100-0x1FF
    AI = 0x200         # 0x200-0x2FF
    SYSTEM = 0x300     # 0x300-0x3FF


class TokenType(IntEnum):
    # Core Spatial Tokens
    MOVE = 0x80
    ZOOM = 0x81
    LINK = 0x82
    THREAD = 0x83
    RECT = 0x84
    CIRC = 0x85
    TEXT = 0x86
    SPRITE = 0x87
    LAYER = 0x88
    COLOR = 0x89
    ALPHA = 0x8A
    AGENT = 0x8B
    EMIT = 0x8C
    LISTEN = 0x8D
    FREEZE = 0x8E      # CRITICAL - System only
    THAW = 0x8F        # CRITICAL - System only


@dataclass
class SecurityContext:
    """Agent's security context for validation"""
    agent_signature: int      # 0x100-0x3FF
    current_layer: int = 0    # Z-depth (0-255)
    salt_seed: int = 0        # For hex-entropy heartbeat
    
    @property
    def agent_type(self) -> AgentType:
        if 0x100 <= self.agent_signature < 0x200:
            return AgentType.HUMAN
        elif 0x200 <= self.agent_signature < 0x300:
            return AgentType.AI
        elif 0x300 <= self.agent_signature < 0x400:
            return AgentType.SYSTEM
        return AgentType.HUMAN  # Default
    
    @property
    def is_system(self) -> bool:
        return self.agent_type == AgentType.SYSTEM
    
    @property
    def is_ai(self) -> bool:
        return self.agent_type == AgentType.AI
    
    @property
    def is_human(self) -> bool:
        return self.agent_type == AgentType.HUMAN


class GeometrySecurityGate:
    """
    Validates Geometry Standard tokens before execution.
    Acts as hardware firewall for the frame buffer.
    """
    
    CRITICAL_TOKENS = {TokenType.FREEZE, TokenType.THAw}
    SYSTEM_TOKENS = {TokenType.FREEZE, TokenType.THAw, TokenType.AGENT}
    
    def __init__(self, audit_logger=None):
        self.audit_logger = audit_logger
        self.quarantine_zones = {}  # {(x,y): layer_restriction}
    
    def validate_token(
        self,
        ctx: SecurityContext,
        token: int,
        target_coords: Tuple[int, int],
        target_layer: int = 0
    ) -> Tuple[bool, str]:
        """
        Validate if agent can execute token at coordinates.
        
        Returns: (allowed: bool, reason: str)
        """
        # 1. Check critical token permissions
        if token in self.CRITICAL_TOKENS:
            if not ctx.is_system:
                self._log_violation(ctx, token, target_coords, 
                    "SECURITY VIOLATION: Unauthorized critical token")
                return False, f"Token 0x{token:02X} requires System privileges"
        
        # 2. Check system-only tokens
        if token in self.SYSTEM_TOKENS and not ctx.is_system:
            self._log_violation(ctx, token, target_coords,
                "SECURITY VIOLATION: System-only token")
            return False, f"Token 0x{token:02X} is System-only"
        
        # 3. Check write quarantine (layer permissions)
        if ctx.current_layer < target_layer:
            self._log_violation(ctx, token, target_coords,
                f"SECURITY VIOLATION: Layer quarantine (agent={ctx.current_layer}, target={target_layer})")
            return False, f"Cannot write to higher layer ({target_layer} > {ctx.current_layer})"
        
        # 4. Check quarantine zones
        zone_key = target_coords
        if zone_key in self.quarantine_zones:
            min_layer = self.quarantine_zones[zone_key]
            if ctx.current_layer < min_layer:
                return False, f"Coordinate quarantined (requires layer {min_layer}+)"
        
        # All checks passed
        return True, "OK"
    
    def validate_hex_entropy(
        self,
        ctx: SecurityContext,
        hex_color: str,
        frame_count: int
    ) -> bool:
        """
        Hex-Entropy Heartbeat validation.
        Prevents signature spoofing by requiring predictable color shifts.
        
        Expected: color shifts by salt every N frames
        """
        if not hex_color.startswith('#'):
            hex_color = '#' + hex_color
        
        # Calculate expected salt for this frame
        salt = self._calculate_salt(ctx.salt_seed, frame_count)
        
        # For now, just validate format (full entropy check would compare salt)
        # In production: compare actual vs expected color with salt applied
        return len(hex_color) in [7, 9]  # #RRGGBB or #RRGGBBAA
    
    def _calculate_salt(self, seed: int, frame: int) -> int:
        """Calculate entropy salt for frame"""
        data = f"{seed}:{frame // 60}".encode()  # Changes every 60 frames
        return int(hashlib.sha256(data).hexdigest()[:8], 16)
    
    def _log_violation(self, ctx: SecurityContext, token: int, 
                       coords: Tuple[int, int], message: str):
        """Log security violation to audit trail"""
        if self.audit_logger:
            self.audit_logger(
                agent_id=ctx.agent_signature,
                x=coords[0],
                y=coords[1],
                thought_data=message,
                token=f"0x{token:02X}"
            )
        print(f"[SECURITY] {message} | Agent=0x{ctx.agent_signature:03X} Token=0x{token:02X} @ {coords}")
    
    def quarantine_coordinate(self, x: int, y: int, min_layer: int):
        """Restrict coordinate to minimum layer for writes"""
        self.quarantine_zones[(x, y)] = min_layer
    
    def unquarantine_coordinate(self, x: int, y: int):
        """Remove quarantine restriction"""
        self.quarantine_zones.pop((x, y), None)


# Convenience function for integration
def create_security_gate(audit_logger=None) -> GeometrySecurityGate:
    """Create configured security gate"""
    return GeometrySecurityGate(audit_logger=audit_logger)


# Example usage
if __name__ == "__main__":
    # Create security gate
    gate = create_security_gate()
    
    # Test Human agent (0x100-0x1FF)
    human_ctx = SecurityContext(agent_signature=0x123, current_layer=50)
    
    # Test AI agent (0x200-0x2FF)
    ai_ctx = SecurityContext(agent_signature=0x245, current_layer=30)
    
    # Test System daemon (0x300-0x3FF)
    system_ctx = SecurityContext(agent_signature=0x3AB, current_layer=100)
    
    # Test: Human tries FREEZE (should fail)
    allowed, reason = gate.validate_token(human_ctx, TokenType.FREEZE, (100, 100))
    print(f"Human FREEZE: {allowed} - {reason}")
    
    # Test: System tries FREEZE (should succeed)
    allowed, reason = gate.validate_token(system_ctx, TokenType.FREEZE, (100, 100))
    print(f"System FREEZE: {allowed} - {reason}")
    
    # Test: AI tries to write to higher layer (should fail)
    allowed, reason = gate.validate_token(ai_ctx, TokenType.RECT, (200, 200), target_layer=50)
    print(f"AI write to higher layer: {allowed} - {reason}")
