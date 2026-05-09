; DESCRIPTION: Draws a white rectangle at (35, 206) with width 51 and height 49.
; PLAN: r0=35(x), r1=206(y), r2=51(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 206
LDI r2, 51
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
