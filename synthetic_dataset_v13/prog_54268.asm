; DESCRIPTION: Draws a purple rectangle at (99, 45) with width 73 and height 88.
; PLAN: r0=99(x), r1=45(y), r2=73(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 45
LDI r2, 73
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
