; DESCRIPTION: Draws a magenta rectangle at (257, 97) with width 118 and height 27.
; PLAN: r0=257(x), r1=97(y), r2=118(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 97
LDI r2, 118
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
