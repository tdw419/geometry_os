; DESCRIPTION: Draws a green rectangle at (329, 8) with width 51 and height 110.
; PLAN: r0=329(x), r1=8(y), r2=51(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 8
LDI r2, 51
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
