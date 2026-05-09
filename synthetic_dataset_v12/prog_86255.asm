; DESCRIPTION: Draws a magenta rectangle at (155, 120) with width 52 and height 103.
; PLAN: r0=155(x), r1=120(y), r2=52(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 120
LDI r2, 52
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
