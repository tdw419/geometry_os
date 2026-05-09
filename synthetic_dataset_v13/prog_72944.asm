; DESCRIPTION: Draws a green rectangle at (358, 110) with width 98 and height 84.
; PLAN: r0=358(x), r1=110(y), r2=98(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 110
LDI r2, 98
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
