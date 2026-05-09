; DESCRIPTION: Draws a blue rectangle at (311, 120) with width 65 and height 73.
; PLAN: r0=311(x), r1=120(y), r2=65(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 120
LDI r2, 65
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
