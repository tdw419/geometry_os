; DESCRIPTION: Draws a white rectangle at (287, 136) with width 51 and height 48.
; PLAN: r0=287(x), r1=136(y), r2=51(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 136
LDI r2, 51
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
