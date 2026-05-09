; DESCRIPTION: Draws a magenta rectangle at (68, 92) with width 105 and height 63.
; PLAN: r0=68(x), r1=92(y), r2=105(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 92
LDI r2, 105
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
