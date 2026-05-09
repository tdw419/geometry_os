; DESCRIPTION: Draws a magenta rectangle at (185, 6) with width 54 and height 71.
; PLAN: r0=185(x), r1=6(y), r2=54(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 6
LDI r2, 54
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
