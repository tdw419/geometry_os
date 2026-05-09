; DESCRIPTION: Draws a magenta rectangle at (90, 97) with width 78 and height 102.
; PLAN: r0=90(x), r1=97(y), r2=78(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 97
LDI r2, 78
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
