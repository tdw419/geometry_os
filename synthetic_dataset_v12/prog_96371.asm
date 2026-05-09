; DESCRIPTION: Draws a white rectangle at (158, 70) with width 12 and height 119.
; PLAN: r0=158(x), r1=70(y), r2=12(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 70
LDI r2, 12
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
