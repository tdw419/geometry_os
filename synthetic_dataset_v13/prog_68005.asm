; DESCRIPTION: Draws a magenta rectangle at (436, 119) with width 34 and height 19.
; PLAN: r0=436(x), r1=119(y), r2=34(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 119
LDI r2, 34
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
