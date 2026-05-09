; DESCRIPTION: Draws a blue rectangle at (38, 115) with width 51 and height 97.
; PLAN: r0=38(x), r1=115(y), r2=51(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 115
LDI r2, 51
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
