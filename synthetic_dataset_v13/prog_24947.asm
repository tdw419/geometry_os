; DESCRIPTION: Draws a magenta rectangle at (141, 175) with width 44 and height 17.
; PLAN: r0=141(x), r1=175(y), r2=44(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 175
LDI r2, 44
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
