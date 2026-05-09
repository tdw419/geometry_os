; DESCRIPTION: Draws a magenta rectangle at (337, 140) with width 89 and height 54.
; PLAN: r0=337(x), r1=140(y), r2=89(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 140
LDI r2, 89
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
