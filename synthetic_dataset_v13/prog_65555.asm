; DESCRIPTION: Draws a magenta rectangle at (61, 105) with width 103 and height 63.
; PLAN: r0=61(x), r1=105(y), r2=103(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 105
LDI r2, 103
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
