; DESCRIPTION: Draws a magenta rectangle at (361, 101) with width 101 and height 17.
; PLAN: r0=361(x), r1=101(y), r2=101(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 101
LDI r2, 101
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
