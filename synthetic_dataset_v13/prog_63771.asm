; DESCRIPTION: Draws a magenta rectangle at (79, 216) with width 93 and height 22.
; PLAN: r0=79(x), r1=216(y), r2=93(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 216
LDI r2, 93
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
