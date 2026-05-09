; DESCRIPTION: Draws a purple rectangle at (172, 40) with width 99 and height 84.
; PLAN: r0=172(x), r1=40(y), r2=99(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 40
LDI r2, 99
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
