; DESCRIPTION: Draws a blue rectangle at (379, 55) with width 51 and height 52.
; PLAN: r0=379(x), r1=55(y), r2=51(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 55
LDI r2, 51
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
