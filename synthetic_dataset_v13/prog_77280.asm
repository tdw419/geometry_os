; DESCRIPTION: Draws a magenta rectangle at (61, 22) with width 116 and height 116.
; PLAN: r0=61(x), r1=22(y), r2=116(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 22
LDI r2, 116
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
