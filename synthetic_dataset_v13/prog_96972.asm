; DESCRIPTION: Draws a magenta rectangle at (111, 111) with width 67 and height 63.
; PLAN: r0=111(x), r1=111(y), r2=67(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 111
LDI r2, 67
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
