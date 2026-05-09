; DESCRIPTION: Draws a white rectangle at (36, 98) with width 118 and height 119.
; PLAN: r0=36(x), r1=98(y), r2=118(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 98
LDI r2, 118
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
