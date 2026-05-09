; DESCRIPTION: Draws a magenta rectangle at (165, 122) with width 89 and height 26.
; PLAN: r0=165(x), r1=122(y), r2=89(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 122
LDI r2, 89
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
