; DESCRIPTION: Draws a green rectangle at (192, 125) with width 51 and height 83.
; PLAN: r0=192(x), r1=125(y), r2=51(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 125
LDI r2, 51
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
