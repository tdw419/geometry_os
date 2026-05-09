; DESCRIPTION: Draws a magenta rectangle at (282, 174) with width 118 and height 10.
; PLAN: r0=282(x), r1=174(y), r2=118(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 174
LDI r2, 118
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
