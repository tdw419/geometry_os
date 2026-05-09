; DESCRIPTION: Draws a magenta rectangle at (162, 118) with width 106 and height 111.
; PLAN: r0=162(x), r1=118(y), r2=106(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 118
LDI r2, 106
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
