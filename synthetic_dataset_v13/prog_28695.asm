; DESCRIPTION: Draws a magenta rectangle at (96, 23) with width 63 and height 69.
; PLAN: r0=96(x), r1=23(y), r2=63(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 23
LDI r2, 63
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
