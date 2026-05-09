; DESCRIPTION: Draws a magenta rectangle at (157, 81) with width 66 and height 116.
; PLAN: r0=157(x), r1=81(y), r2=66(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 81
LDI r2, 66
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
