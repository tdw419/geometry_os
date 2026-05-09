; DESCRIPTION: Draws a magenta rectangle at (162, 172) with width 68 and height 49.
; PLAN: r0=162(x), r1=172(y), r2=68(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 172
LDI r2, 68
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
