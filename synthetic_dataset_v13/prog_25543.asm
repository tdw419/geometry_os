; DESCRIPTION: Draws a white rectangle at (385, 51) with width 60 and height 101.
; PLAN: r0=385(x), r1=51(y), r2=60(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 51
LDI r2, 60
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
