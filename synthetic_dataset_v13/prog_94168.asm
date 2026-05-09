; DESCRIPTION: Draws a white rectangle at (324, 104) with width 107 and height 55.
; PLAN: r0=324(x), r1=104(y), r2=107(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 104
LDI r2, 107
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
