; DESCRIPTION: Draws a magenta rectangle at (456, 31) with width 14 and height 116.
; PLAN: r0=456(x), r1=31(y), r2=14(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 31
LDI r2, 14
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
