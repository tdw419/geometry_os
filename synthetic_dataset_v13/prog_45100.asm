; DESCRIPTION: Draws a magenta rectangle at (35, 94) with width 87 and height 40.
; PLAN: r0=35(x), r1=94(y), r2=87(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 94
LDI r2, 87
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
