; DESCRIPTION: Draws a purple rectangle at (204, 139) with width 35 and height 106.
; PLAN: r0=204(x), r1=139(y), r2=35(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 139
LDI r2, 35
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
