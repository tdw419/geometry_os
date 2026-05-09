; DESCRIPTION: Draws a magenta rectangle at (145, 36) with width 67 and height 32.
; PLAN: r0=145(x), r1=36(y), r2=67(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 36
LDI r2, 67
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
