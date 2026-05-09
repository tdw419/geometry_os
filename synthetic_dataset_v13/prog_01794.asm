; DESCRIPTION: Draws a white rectangle at (40, 19) with width 81 and height 89.
; PLAN: r0=40(x), r1=19(y), r2=81(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 19
LDI r2, 81
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
