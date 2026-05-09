; DESCRIPTION: Draws a white rectangle at (227, 147) with width 71 and height 51.
; PLAN: r0=227(x), r1=147(y), r2=71(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 147
LDI r2, 71
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
