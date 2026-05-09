; DESCRIPTION: Places a purple 42x103 rectangle at position (25, 53).
; PLAN: r0=25(x), r1=53(y), r2=42(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 53
LDI r2, 42
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
