; DESCRIPTION: Draws a purple rectangle at (90, 56) with width 40 and height 110.
; PLAN: r0=90(x), r1=56(y), r2=40(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 56
LDI r2, 40
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
