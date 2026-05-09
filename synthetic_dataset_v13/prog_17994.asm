; DESCRIPTION: Draws a purple rectangle at (424, 60) with width 13 and height 84.
; PLAN: r0=424(x), r1=60(y), r2=13(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 60
LDI r2, 13
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
