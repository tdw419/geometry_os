; DESCRIPTION: Draws a magenta rectangle at (266, 24) with width 118 and height 111.
; PLAN: r0=266(x), r1=24(y), r2=118(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 24
LDI r2, 118
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
