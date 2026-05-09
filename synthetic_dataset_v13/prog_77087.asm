; DESCRIPTION: Draws a magenta rectangle at (201, 28) with width 115 and height 118.
; PLAN: r0=201(x), r1=28(y), r2=115(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 28
LDI r2, 115
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
