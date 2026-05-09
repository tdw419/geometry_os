; DESCRIPTION: Draws a magenta rectangle at (89, 34) with width 43 and height 72.
; PLAN: r0=89(x), r1=34(y), r2=43(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 34
LDI r2, 43
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
