; DESCRIPTION: Places a magenta 88x49 rectangle at position (56, 140).
; PLAN: r0=56(x), r1=140(y), r2=88(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 140
LDI r2, 88
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
