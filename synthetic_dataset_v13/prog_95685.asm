; DESCRIPTION: Draws a white rectangle at (267, 89) with width 102 and height 15.
; PLAN: r0=267(x), r1=89(y), r2=102(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 89
LDI r2, 102
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
