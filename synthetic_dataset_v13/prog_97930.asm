; DESCRIPTION: Draws a white rectangle at (308, 104) with width 61 and height 36.
; PLAN: r0=308(x), r1=104(y), r2=61(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 104
LDI r2, 61
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
