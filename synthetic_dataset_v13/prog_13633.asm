; DESCRIPTION: Draws a purple rectangle at (222, 144) with width 11 and height 100.
; PLAN: r0=222(x), r1=144(y), r2=11(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 144
LDI r2, 11
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
