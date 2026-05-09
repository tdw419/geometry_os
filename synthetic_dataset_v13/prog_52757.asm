; DESCRIPTION: Draws a white rectangle at (1, 115) with width 49 and height 54.
; PLAN: r0=1(x), r1=115(y), r2=49(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 115
LDI r2, 49
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
