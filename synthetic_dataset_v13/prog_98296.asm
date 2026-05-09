; DESCRIPTION: Draws a white rectangle at (129, 144) with width 107 and height 110.
; PLAN: r0=129(x), r1=144(y), r2=107(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 144
LDI r2, 107
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
