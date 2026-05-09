; DESCRIPTION: Draws a magenta rectangle at (326, 118) with width 112 and height 30.
; PLAN: r0=326(x), r1=118(y), r2=112(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 118
LDI r2, 112
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
