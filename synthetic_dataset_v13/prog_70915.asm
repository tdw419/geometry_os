; DESCRIPTION: Draws a magenta rectangle at (172, 83) with width 25 and height 54.
; PLAN: r0=172(x), r1=83(y), r2=25(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 83
LDI r2, 25
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
