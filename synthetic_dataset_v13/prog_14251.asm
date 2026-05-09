; DESCRIPTION: Draws a white rectangle at (62, 130) with width 110 and height 98.
; PLAN: r0=62(x), r1=130(y), r2=110(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 130
LDI r2, 110
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
