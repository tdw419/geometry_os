; DESCRIPTION: Draws a white rectangle at (177, 199) with width 105 and height 34.
; PLAN: r0=177(x), r1=199(y), r2=105(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 199
LDI r2, 105
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
