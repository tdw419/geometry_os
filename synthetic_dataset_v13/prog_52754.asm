; DESCRIPTION: Draws a magenta rectangle at (226, 198) with width 18 and height 33.
; PLAN: r0=226(x), r1=198(y), r2=18(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 198
LDI r2, 18
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
