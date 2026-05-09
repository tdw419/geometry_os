; DESCRIPTION: Draws a white rectangle at (314, 45) with width 88 and height 91.
; PLAN: r0=314(x), r1=45(y), r2=88(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 45
LDI r2, 88
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
