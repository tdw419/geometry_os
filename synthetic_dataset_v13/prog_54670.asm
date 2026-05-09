; DESCRIPTION: Draws a green rectangle at (51, 86) with width 105 and height 17.
; PLAN: r0=51(x), r1=86(y), r2=105(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 86
LDI r2, 105
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
