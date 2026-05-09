; DESCRIPTION: Draws a magenta rectangle at (38, 96) with width 56 and height 43.
; PLAN: r0=38(x), r1=96(y), r2=56(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 96
LDI r2, 56
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
