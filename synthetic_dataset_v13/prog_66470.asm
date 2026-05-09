; DESCRIPTION: Draws a purple rectangle at (490, 24) with width 19 and height 98.
; PLAN: r0=490(x), r1=24(y), r2=19(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 24
LDI r2, 19
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
