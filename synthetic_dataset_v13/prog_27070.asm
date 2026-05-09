; DESCRIPTION: Draws a purple rectangle at (88, 124) with width 43 and height 83.
; PLAN: r0=88(x), r1=124(y), r2=43(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 124
LDI r2, 43
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
