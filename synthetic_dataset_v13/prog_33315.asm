; DESCRIPTION: Draws a white rectangle at (155, 38) with width 97 and height 78.
; PLAN: r0=155(x), r1=38(y), r2=97(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 38
LDI r2, 97
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
