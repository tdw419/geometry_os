; DESCRIPTION: Draws a magenta rectangle at (201, 103) with width 120 and height 38.
; PLAN: r0=201(x), r1=103(y), r2=120(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 103
LDI r2, 120
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
