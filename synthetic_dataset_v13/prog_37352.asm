; DESCRIPTION: Draws a magenta rectangle at (407, 29) with width 77 and height 34.
; PLAN: r0=407(x), r1=29(y), r2=77(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 29
LDI r2, 77
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
