; DESCRIPTION: Draws a magenta rectangle at (9, 68) with width 81 and height 54.
; PLAN: r0=9(x), r1=68(y), r2=81(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 68
LDI r2, 81
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
