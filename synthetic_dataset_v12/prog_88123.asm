; DESCRIPTION: Draws a magenta rectangle at (314, 77) with width 94 and height 76.
; PLAN: r0=314(x), r1=77(y), r2=94(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 77
LDI r2, 94
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
