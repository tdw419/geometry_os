; DESCRIPTION: Draws a magenta rectangle at (441, 1) with width 18 and height 114.
; PLAN: r0=441(x), r1=1(y), r2=18(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 1
LDI r2, 18
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
