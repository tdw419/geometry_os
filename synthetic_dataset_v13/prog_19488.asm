; DESCRIPTION: Draws a magenta rectangle at (33, 169) with width 92 and height 62.
; PLAN: r0=33(x), r1=169(y), r2=92(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 169
LDI r2, 92
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
