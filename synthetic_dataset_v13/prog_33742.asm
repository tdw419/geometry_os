; DESCRIPTION: Draws a green rectangle at (164, 29) with width 49 and height 119.
; PLAN: r0=164(x), r1=29(y), r2=49(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 29
LDI r2, 49
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
