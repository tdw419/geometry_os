; DESCRIPTION: Places a magenta 42x115 rectangle at position (82, 116).
; PLAN: r0=82(x), r1=116(y), r2=42(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 116
LDI r2, 42
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
