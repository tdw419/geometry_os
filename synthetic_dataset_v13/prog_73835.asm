; DESCRIPTION: Draws a magenta rectangle at (331, 57) with width 81 and height 43.
; PLAN: r0=331(x), r1=57(y), r2=81(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 57
LDI r2, 81
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
