; DESCRIPTION: Draws a magenta rectangle at (444, 29) with width 43 and height 96.
; PLAN: r0=444(x), r1=29(y), r2=43(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 29
LDI r2, 43
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
