; DESCRIPTION: Draws a magenta rectangle at (116, 87) with width 15 and height 47.
; PLAN: r0=116(x), r1=87(y), r2=15(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 87
LDI r2, 15
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
