; DESCRIPTION: Draws a magenta rectangle at (179, 147) with width 101 and height 103.
; PLAN: r0=179(x), r1=147(y), r2=101(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 147
LDI r2, 101
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
