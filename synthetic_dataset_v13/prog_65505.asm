; DESCRIPTION: Draws a purple rectangle at (192, 75) with width 90 and height 110.
; PLAN: r0=192(x), r1=75(y), r2=90(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 75
LDI r2, 90
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
