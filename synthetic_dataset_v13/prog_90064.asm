; DESCRIPTION: Draws a white rectangle at (131, 95) with width 89 and height 17.
; PLAN: r0=131(x), r1=95(y), r2=89(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 95
LDI r2, 89
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
