; DESCRIPTION: Draws a magenta rectangle at (16, 174) with width 92 and height 67.
; PLAN: r0=16(x), r1=174(y), r2=92(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 174
LDI r2, 92
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
