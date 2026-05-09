; DESCRIPTION: Draws a blue rectangle at (139, 200) with width 110 and height 23.
; PLAN: r0=139(x), r1=200(y), r2=110(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 200
LDI r2, 110
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
