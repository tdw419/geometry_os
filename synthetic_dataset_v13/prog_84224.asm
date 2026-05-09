; DESCRIPTION: Draws a magenta rectangle at (24, 94) with width 26 and height 14.
; PLAN: r0=24(x), r1=94(y), r2=26(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 94
LDI r2, 26
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
