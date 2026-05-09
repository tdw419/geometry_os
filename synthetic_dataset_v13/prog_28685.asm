; DESCRIPTION: Draws a magenta rectangle at (109, 4) with width 66 and height 60.
; PLAN: r0=109(x), r1=4(y), r2=66(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 4
LDI r2, 66
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
