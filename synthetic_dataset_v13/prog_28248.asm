; DESCRIPTION: Draws a magenta rectangle at (2, 12) with width 43 and height 116.
; PLAN: r0=2(x), r1=12(y), r2=43(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 12
LDI r2, 43
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
