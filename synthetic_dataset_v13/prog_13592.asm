; DESCRIPTION: Draws a green rectangle at (122, 51) with width 25 and height 66.
; PLAN: r0=122(x), r1=51(y), r2=25(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 51
LDI r2, 25
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
