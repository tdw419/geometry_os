; DESCRIPTION: Draws a magenta rectangle at (359, 47) with width 114 and height 39.
; PLAN: r0=359(x), r1=47(y), r2=114(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 47
LDI r2, 114
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
