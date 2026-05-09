; DESCRIPTION: Draws a white rectangle at (98, 51) with width 32 and height 105.
; PLAN: r0=98(x), r1=51(y), r2=32(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 51
LDI r2, 32
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
