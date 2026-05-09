; DESCRIPTION: Draws a magenta rectangle at (200, 150) with width 72 and height 67.
; PLAN: r0=200(x), r1=150(y), r2=72(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 150
LDI r2, 72
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
