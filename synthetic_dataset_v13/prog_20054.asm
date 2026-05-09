; DESCRIPTION: Draws a magenta rectangle at (219, 12) with width 56 and height 116.
; PLAN: r0=219(x), r1=12(y), r2=56(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 12
LDI r2, 56
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
