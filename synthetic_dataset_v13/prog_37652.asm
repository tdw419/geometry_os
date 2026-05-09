; DESCRIPTION: Draws a magenta rectangle at (285, 35) with width 116 and height 84.
; PLAN: r0=285(x), r1=35(y), r2=116(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 35
LDI r2, 116
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
