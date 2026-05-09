; DESCRIPTION: Draws a white rectangle at (314, 145) with width 38 and height 74.
; PLAN: r0=314(x), r1=145(y), r2=38(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 145
LDI r2, 38
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
