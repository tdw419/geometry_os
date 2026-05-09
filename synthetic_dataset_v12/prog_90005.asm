; DESCRIPTION: Draws a white rectangle at (234, 94) with width 89 and height 109.
; PLAN: r0=234(x), r1=94(y), r2=89(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 94
LDI r2, 89
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
