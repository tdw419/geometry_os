; DESCRIPTION: Draws a magenta rectangle at (338, 43) with width 90 and height 31.
; PLAN: r0=338(x), r1=43(y), r2=90(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 43
LDI r2, 90
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
