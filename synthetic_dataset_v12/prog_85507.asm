; DESCRIPTION: Draws a white rectangle at (104, 40) with width 11 and height 89.
; PLAN: r0=104(x), r1=40(y), r2=11(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 40
LDI r2, 11
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
