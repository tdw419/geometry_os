; DESCRIPTION: Draws a white rectangle at (418, 83) with width 85 and height 104.
; PLAN: r0=418(x), r1=83(y), r2=85(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 83
LDI r2, 85
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
