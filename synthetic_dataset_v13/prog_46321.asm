; DESCRIPTION: Draws a magenta rectangle at (420, 156) with width 73 and height 59.
; PLAN: r0=420(x), r1=156(y), r2=73(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 156
LDI r2, 73
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
