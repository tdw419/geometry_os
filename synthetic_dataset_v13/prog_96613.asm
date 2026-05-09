; DESCRIPTION: Draws a green rectangle at (419, 110) with width 35 and height 113.
; PLAN: r0=419(x), r1=110(y), r2=35(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 110
LDI r2, 35
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
