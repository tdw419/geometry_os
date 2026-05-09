; DESCRIPTION: Draws a magenta rectangle at (114, 50) with width 110 and height 63.
; PLAN: r0=114(x), r1=50(y), r2=110(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 50
LDI r2, 110
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
