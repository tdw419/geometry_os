; DESCRIPTION: Draws a blue rectangle at (153, 52) with width 110 and height 63.
; PLAN: r0=153(x), r1=52(y), r2=110(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 52
LDI r2, 110
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
