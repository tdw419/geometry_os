; DESCRIPTION: Draws a white rectangle at (77, 74) with width 36 and height 104.
; PLAN: r0=77(x), r1=74(y), r2=36(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 74
LDI r2, 36
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
