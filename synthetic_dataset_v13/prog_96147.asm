; DESCRIPTION: Draws a purple rectangle at (390, 51) with width 91 and height 45.
; PLAN: r0=390(x), r1=51(y), r2=91(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 51
LDI r2, 91
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
