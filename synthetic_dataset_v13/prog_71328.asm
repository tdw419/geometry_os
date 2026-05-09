; DESCRIPTION: Draws a white rectangle at (334, 70) with width 115 and height 118.
; PLAN: r0=334(x), r1=70(y), r2=115(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 70
LDI r2, 115
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
