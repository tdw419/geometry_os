; DESCRIPTION: Draws a magenta rectangle at (432, 40) with width 57 and height 29.
; PLAN: r0=432(x), r1=40(y), r2=57(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 40
LDI r2, 57
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
