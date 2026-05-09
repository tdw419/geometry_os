; DESCRIPTION: Draws a magenta rectangle at (71, 145) with width 116 and height 99.
; PLAN: r0=71(x), r1=145(y), r2=116(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 145
LDI r2, 116
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
