; DESCRIPTION: Draws a magenta rectangle at (58, 160) with width 89 and height 69.
; PLAN: r0=58(x), r1=160(y), r2=89(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 160
LDI r2, 89
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
