; DESCRIPTION: Draws a blue rectangle at (155, 47) with width 37 and height 33.
; PLAN: r0=155(x), r1=47(y), r2=37(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 47
LDI r2, 37
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
