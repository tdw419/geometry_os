; DESCRIPTION: Draws a magenta rectangle at (77, 29) with width 116 and height 86.
; PLAN: r0=77(x), r1=29(y), r2=116(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 29
LDI r2, 116
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
