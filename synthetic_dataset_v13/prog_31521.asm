; DESCRIPTION: Draws a magenta rectangle at (150, 136) with width 111 and height 66.
; PLAN: r0=150(x), r1=136(y), r2=111(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 136
LDI r2, 111
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
