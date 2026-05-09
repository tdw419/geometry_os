; DESCRIPTION: Draws a white rectangle at (448, 51) with width 10 and height 14.
; PLAN: r0=448(x), r1=51(y), r2=10(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 51
LDI r2, 10
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
