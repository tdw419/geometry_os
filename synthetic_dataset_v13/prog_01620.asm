; DESCRIPTION: Draws a magenta rectangle at (270, 169) with width 103 and height 75.
; PLAN: r0=270(x), r1=169(y), r2=103(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 169
LDI r2, 103
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
