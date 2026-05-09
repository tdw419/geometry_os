; DESCRIPTION: Draws a white rectangle at (233, 136) with width 45 and height 119.
; PLAN: r0=233(x), r1=136(y), r2=45(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 136
LDI r2, 45
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
