; DESCRIPTION: Draws a yellow rectangle at (390, 203) with width 89 and height 51.
; PLAN: r0=390(x), r1=203(y), r2=89(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 203
LDI r2, 89
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
