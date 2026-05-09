; DESCRIPTION: Draws a magenta rectangle at (370, 77) with width 24 and height 19.
; PLAN: r0=370(x), r1=77(y), r2=24(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 77
LDI r2, 24
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
