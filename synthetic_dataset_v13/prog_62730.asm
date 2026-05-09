; DESCRIPTION: Draws a magenta rectangle at (444, 88) with width 15 and height 96.
; PLAN: r0=444(x), r1=88(y), r2=15(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 88
LDI r2, 15
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
