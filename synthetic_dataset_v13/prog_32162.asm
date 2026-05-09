; DESCRIPTION: Draws a magenta rectangle at (377, 63) with width 30 and height 78.
; PLAN: r0=377(x), r1=63(y), r2=30(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 63
LDI r2, 30
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
