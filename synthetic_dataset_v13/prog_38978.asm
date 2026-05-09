; DESCRIPTION: Draws a white rectangle at (104, 56) with width 102 and height 31.
; PLAN: r0=104(x), r1=56(y), r2=102(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 56
LDI r2, 102
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
