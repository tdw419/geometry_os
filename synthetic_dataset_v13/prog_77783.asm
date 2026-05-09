; DESCRIPTION: Draws a magenta rectangle at (274, 30) with width 25 and height 20.
; PLAN: r0=274(x), r1=30(y), r2=25(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 30
LDI r2, 25
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
