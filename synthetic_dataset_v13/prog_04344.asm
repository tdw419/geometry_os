; DESCRIPTION: Draws a magenta rectangle at (201, 133) with width 100 and height 26.
; PLAN: r0=201(x), r1=133(y), r2=100(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 133
LDI r2, 100
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
