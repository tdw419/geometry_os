; DESCRIPTION: Draws a purple rectangle at (347, 35) with width 66 and height 71.
; PLAN: r0=347(x), r1=35(y), r2=66(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 35
LDI r2, 66
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
