; DESCRIPTION: Draws a magenta rectangle at (147, 117) with width 102 and height 112.
; PLAN: r0=147(x), r1=117(y), r2=102(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 117
LDI r2, 102
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
