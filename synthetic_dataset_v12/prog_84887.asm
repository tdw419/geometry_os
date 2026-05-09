; DESCRIPTION: Draws a magenta rectangle at (376, 81) with width 114 and height 112.
; PLAN: r0=376(x), r1=81(y), r2=114(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 81
LDI r2, 114
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
