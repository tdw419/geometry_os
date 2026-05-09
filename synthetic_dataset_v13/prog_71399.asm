; DESCRIPTION: Draws a magenta rectangle at (98, 1) with width 66 and height 89.
; PLAN: r0=98(x), r1=1(y), r2=66(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 1
LDI r2, 66
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
