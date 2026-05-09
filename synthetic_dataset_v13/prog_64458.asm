; DESCRIPTION: Draws a yellow rectangle at (341, 84) with width 89 and height 105.
; PLAN: r0=341(x), r1=84(y), r2=89(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 84
LDI r2, 89
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
