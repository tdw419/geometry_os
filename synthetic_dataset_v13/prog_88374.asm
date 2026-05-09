; DESCRIPTION: Places a purple 42x92 rectangle at position (69, 53).
; PLAN: r0=69(x), r1=53(y), r2=42(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 53
LDI r2, 42
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
