; DESCRIPTION: Draws a white rectangle at (139, 112) with width 112 and height 104.
; PLAN: r0=139(x), r1=112(y), r2=112(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 112
LDI r2, 112
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
