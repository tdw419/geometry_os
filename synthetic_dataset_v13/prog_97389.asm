; DESCRIPTION: Draws a white rectangle at (341, 34) with width 11 and height 84.
; PLAN: r0=341(x), r1=34(y), r2=11(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 34
LDI r2, 11
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
