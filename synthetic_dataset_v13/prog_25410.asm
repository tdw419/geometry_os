; DESCRIPTION: Draws a white rectangle at (378, 124) with width 116 and height 110.
; PLAN: r0=378(x), r1=124(y), r2=116(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 124
LDI r2, 116
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
