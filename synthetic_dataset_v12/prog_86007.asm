; DESCRIPTION: Draws a green rectangle at (338, 188) with width 35 and height 15.
; PLAN: r0=338(x), r1=188(y), r2=35(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 188
LDI r2, 35
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
