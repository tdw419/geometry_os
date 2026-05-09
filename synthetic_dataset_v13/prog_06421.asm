; DESCRIPTION: Draws a magenta rectangle at (116, 52) with width 116 and height 43.
; PLAN: r0=116(x), r1=52(y), r2=116(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 52
LDI r2, 116
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
