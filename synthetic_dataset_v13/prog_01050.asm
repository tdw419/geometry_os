; DESCRIPTION: Draws a green rectangle at (185, 51) with width 61 and height 52.
; PLAN: r0=185(x), r1=51(y), r2=61(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 51
LDI r2, 61
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
