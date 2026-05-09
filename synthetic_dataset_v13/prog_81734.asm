; DESCRIPTION: Draws a magenta rectangle at (381, 155) with width 67 and height 56.
; PLAN: r0=381(x), r1=155(y), r2=67(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 155
LDI r2, 67
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
