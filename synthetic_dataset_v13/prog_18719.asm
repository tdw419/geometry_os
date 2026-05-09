; DESCRIPTION: Draws a magenta rectangle at (323, 128) with width 118 and height 97.
; PLAN: r0=323(x), r1=128(y), r2=118(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 128
LDI r2, 118
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
