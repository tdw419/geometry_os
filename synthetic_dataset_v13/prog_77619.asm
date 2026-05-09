; DESCRIPTION: Places a magenta 115x119 rectangle at position (88, 32).
; PLAN: r0=88(x), r1=32(y), r2=115(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 32
LDI r2, 115
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
