; DESCRIPTION: Draws a blue rectangle at (200, 15) with width 36 and height 22.
; PLAN: r0=200(x), r1=15(y), r2=36(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 15
LDI r2, 36
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
