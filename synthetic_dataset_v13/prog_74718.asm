; DESCRIPTION: Draws a magenta rectangle at (56, 116) with width 108 and height 53.
; PLAN: r0=56(x), r1=116(y), r2=108(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 116
LDI r2, 108
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
