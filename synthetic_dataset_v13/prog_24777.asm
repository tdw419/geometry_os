; DESCRIPTION: Draws a magenta rectangle at (35, 183) with width 54 and height 38.
; PLAN: r0=35(x), r1=183(y), r2=54(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 183
LDI r2, 54
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
