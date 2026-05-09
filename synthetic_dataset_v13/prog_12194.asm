; DESCRIPTION: Draws a white rectangle at (203, 147) with width 102 and height 104.
; PLAN: r0=203(x), r1=147(y), r2=102(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 147
LDI r2, 102
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
