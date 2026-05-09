; DESCRIPTION: Draws a green rectangle at (138, 137) with width 51 and height 81.
; PLAN: r0=138(x), r1=137(y), r2=51(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 137
LDI r2, 51
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
