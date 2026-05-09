; DESCRIPTION: Draws a white rectangle at (118, 40) with width 112 and height 66.
; PLAN: r0=118(x), r1=40(y), r2=112(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 40
LDI r2, 112
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
