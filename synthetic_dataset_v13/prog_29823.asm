; DESCRIPTION: Draws a purple rectangle at (77, 211) with width 107 and height 38.
; PLAN: r0=77(x), r1=211(y), r2=107(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 211
LDI r2, 107
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
