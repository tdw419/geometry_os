; DESCRIPTION: Draws a magenta rectangle at (131, 144) with width 118 and height 20.
; PLAN: r0=131(x), r1=144(y), r2=118(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 144
LDI r2, 118
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
