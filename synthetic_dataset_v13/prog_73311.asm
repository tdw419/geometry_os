; DESCRIPTION: Draws a white rectangle at (208, 51) with width 102 and height 102.
; PLAN: r0=208(x), r1=51(y), r2=102(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 51
LDI r2, 102
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
