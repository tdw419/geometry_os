; DESCRIPTION: Draws a magenta rectangle at (247, 91) with width 118 and height 91.
; PLAN: r0=247(x), r1=91(y), r2=118(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 91
LDI r2, 118
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
