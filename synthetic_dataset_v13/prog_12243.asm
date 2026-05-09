; DESCRIPTION: Draws a purple rectangle at (478, 90) with width 19 and height 20.
; PLAN: r0=478(x), r1=90(y), r2=19(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 90
LDI r2, 19
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
