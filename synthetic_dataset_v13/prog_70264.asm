; DESCRIPTION: Draws a magenta rectangle at (428, 116) with width 24 and height 84.
; PLAN: r0=428(x), r1=116(y), r2=24(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 116
LDI r2, 24
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
