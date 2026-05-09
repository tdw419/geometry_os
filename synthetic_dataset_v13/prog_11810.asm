; DESCRIPTION: Draws a purple rectangle at (194, 98) with width 33 and height 88.
; PLAN: r0=194(x), r1=98(y), r2=33(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 98
LDI r2, 33
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
