; DESCRIPTION: Draws a blue rectangle at (65, 123) with width 85 and height 84.
; PLAN: r0=65(x), r1=123(y), r2=85(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 123
LDI r2, 85
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
