; DESCRIPTION: Draws a magenta rectangle at (29, 30) with width 92 and height 114.
; PLAN: r0=29(x), r1=30(y), r2=92(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 30
LDI r2, 92
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
