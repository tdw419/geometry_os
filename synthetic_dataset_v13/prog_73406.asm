; DESCRIPTION: Draws a purple rectangle at (192, 122) with width 119 and height 112.
; PLAN: r0=192(x), r1=122(y), r2=119(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 122
LDI r2, 119
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
