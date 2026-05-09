; DESCRIPTION: Draws a white rectangle at (136, 141) with width 105 and height 23.
; PLAN: r0=136(x), r1=141(y), r2=105(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 141
LDI r2, 105
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
