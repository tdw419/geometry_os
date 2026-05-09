; DESCRIPTION: Draws a white rectangle at (143, 198) with width 89 and height 51.
; PLAN: r0=143(x), r1=198(y), r2=89(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 198
LDI r2, 89
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
