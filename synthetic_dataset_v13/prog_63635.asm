; DESCRIPTION: Draws a magenta rectangle at (449, 144) with width 15 and height 68.
; PLAN: r0=449(x), r1=144(y), r2=15(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 144
LDI r2, 15
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
