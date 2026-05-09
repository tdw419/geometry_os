; DESCRIPTION: Draws a purple rectangle at (88, 49) with width 77 and height 90.
; PLAN: r0=88(x), r1=49(y), r2=77(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 49
LDI r2, 77
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
