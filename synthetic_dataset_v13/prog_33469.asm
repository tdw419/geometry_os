; DESCRIPTION: Draws a blue rectangle at (200, 110) with width 85 and height 31.
; PLAN: r0=200(x), r1=110(y), r2=85(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 110
LDI r2, 85
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
