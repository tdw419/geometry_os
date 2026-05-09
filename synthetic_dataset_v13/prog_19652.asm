; DESCRIPTION: Draws a white rectangle at (325, 110) with width 36 and height 92.
; PLAN: r0=325(x), r1=110(y), r2=36(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 110
LDI r2, 36
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
