; DESCRIPTION: Draws a magenta rectangle at (163, 105) with width 67 and height 109.
; PLAN: r0=163(x), r1=105(y), r2=67(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 105
LDI r2, 67
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
