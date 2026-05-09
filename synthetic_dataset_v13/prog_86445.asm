; DESCRIPTION: Draws a white rectangle at (400, 138) with width 89 and height 43.
; PLAN: r0=400(x), r1=138(y), r2=89(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 138
LDI r2, 89
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
