; DESCRIPTION: Draws a magenta rectangle at (381, 188) with width 112 and height 63.
; PLAN: r0=381(x), r1=188(y), r2=112(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 188
LDI r2, 112
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
