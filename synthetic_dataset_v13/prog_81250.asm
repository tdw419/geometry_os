; DESCRIPTION: Draws a magenta rectangle at (409, 36) with width 34 and height 119.
; PLAN: r0=409(x), r1=36(y), r2=34(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 36
LDI r2, 34
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
