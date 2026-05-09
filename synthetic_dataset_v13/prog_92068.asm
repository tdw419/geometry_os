; DESCRIPTION: Draws a purple rectangle at (106, 83) with width 30 and height 112.
; PLAN: r0=106(x), r1=83(y), r2=30(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 83
LDI r2, 30
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
