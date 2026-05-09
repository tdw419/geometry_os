; DESCRIPTION: Draws a magenta rectangle at (249, 83) with width 19 and height 70.
; PLAN: r0=249(x), r1=83(y), r2=19(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 83
LDI r2, 19
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
