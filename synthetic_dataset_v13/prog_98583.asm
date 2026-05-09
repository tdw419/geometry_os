; DESCRIPTION: Draws a purple rectangle at (364, 25) with width 110 and height 76.
; PLAN: r0=364(x), r1=25(y), r2=110(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 25
LDI r2, 110
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
