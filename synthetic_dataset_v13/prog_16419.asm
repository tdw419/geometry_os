; DESCRIPTION: Draws a green rectangle at (184, 51) with width 33 and height 84.
; PLAN: r0=184(x), r1=51(y), r2=33(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 51
LDI r2, 33
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
