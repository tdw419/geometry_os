; DESCRIPTION: Draws a white rectangle at (273, 144) with width 118 and height 112.
; PLAN: r0=273(x), r1=144(y), r2=118(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 144
LDI r2, 118
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
