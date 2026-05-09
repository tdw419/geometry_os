; DESCRIPTION: Draws a magenta rectangle at (176, 15) with width 78 and height 90.
; PLAN: r0=176(x), r1=15(y), r2=78(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 15
LDI r2, 78
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
