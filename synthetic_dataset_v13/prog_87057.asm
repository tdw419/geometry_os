; DESCRIPTION: Draws a white rectangle at (319, 164) with width 112 and height 89.
; PLAN: r0=319(x), r1=164(y), r2=112(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 164
LDI r2, 112
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
