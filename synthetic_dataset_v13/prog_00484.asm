; DESCRIPTION: Places a magenta 33x115 rectangle at position (53, 10).
; PLAN: r0=53(x), r1=10(y), r2=33(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 10
LDI r2, 33
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
