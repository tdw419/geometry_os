; DESCRIPTION: Draws a blue rectangle at (377, 51) with width 58 and height 115.
; PLAN: r0=377(x), r1=51(y), r2=58(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 51
LDI r2, 58
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
