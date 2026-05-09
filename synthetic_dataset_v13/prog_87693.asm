; DESCRIPTION: Places a blue 11x33 rectangle at position (11, 88).
; PLAN: r0=11(x), r1=88(y), r2=11(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 88
LDI r2, 11
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
