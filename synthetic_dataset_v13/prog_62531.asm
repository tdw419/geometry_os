; DESCRIPTION: Draws a purple rectangle at (451, 138) with width 10 and height 17.
; PLAN: r0=451(x), r1=138(y), r2=10(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 138
LDI r2, 10
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
