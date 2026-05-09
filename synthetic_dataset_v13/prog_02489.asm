; DESCRIPTION: Draws a white rectangle at (22, 4) with width 115 and height 117.
; PLAN: r0=22(x), r1=4(y), r2=115(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 4
LDI r2, 115
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
