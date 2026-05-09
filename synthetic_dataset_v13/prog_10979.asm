; DESCRIPTION: Draws a magenta rectangle at (22, 53) with width 84 and height 89.
; PLAN: r0=22(x), r1=53(y), r2=84(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 53
LDI r2, 84
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
