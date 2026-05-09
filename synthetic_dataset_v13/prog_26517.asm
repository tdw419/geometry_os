; DESCRIPTION: Draws a blue rectangle at (145, 123) with width 115 and height 111.
; PLAN: r0=145(x), r1=123(y), r2=115(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 123
LDI r2, 115
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
