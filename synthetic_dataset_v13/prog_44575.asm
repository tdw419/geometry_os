; DESCRIPTION: Draws a green rectangle at (289, 118) with width 73 and height 112.
; PLAN: r0=289(x), r1=118(y), r2=73(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 118
LDI r2, 73
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
