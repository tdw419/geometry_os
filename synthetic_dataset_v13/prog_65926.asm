; DESCRIPTION: Draws a magenta rectangle at (311, 68) with width 56 and height 47.
; PLAN: r0=311(x), r1=68(y), r2=56(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 68
LDI r2, 56
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
