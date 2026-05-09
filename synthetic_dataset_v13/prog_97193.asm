; DESCRIPTION: Draws a purple rectangle at (132, 35) with width 78 and height 108.
; PLAN: r0=132(x), r1=35(y), r2=78(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 35
LDI r2, 78
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
