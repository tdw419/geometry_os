; DESCRIPTION: Draws a green rectangle at (184, 200) with width 110 and height 49.
; PLAN: r0=184(x), r1=200(y), r2=110(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 200
LDI r2, 110
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
