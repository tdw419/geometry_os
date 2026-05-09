; DESCRIPTION: Draws a magenta rectangle at (97, 179) with width 56 and height 60.
; PLAN: r0=97(x), r1=179(y), r2=56(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 179
LDI r2, 56
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
