; DESCRIPTION: Draws a magenta rectangle at (193, 0) with width 118 and height 29.
; PLAN: r0=193(x), r1=0(y), r2=118(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 0
LDI r2, 118
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
