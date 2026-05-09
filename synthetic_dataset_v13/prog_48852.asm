; DESCRIPTION: Places a magenta 52x73 rectangle at position (49, 17).
; PLAN: r0=49(x), r1=17(y), r2=52(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 17
LDI r2, 52
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
