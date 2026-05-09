; DESCRIPTION: Places a magenta 10x49 rectangle at position (388, 122).
; PLAN: r0=388(x), r1=122(y), r2=10(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 122
LDI r2, 10
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
