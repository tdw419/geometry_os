; DESCRIPTION: Draws a blue rectangle at (311, 65) with width 29 and height 101.
; PLAN: r0=311(x), r1=65(y), r2=29(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 65
LDI r2, 29
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
