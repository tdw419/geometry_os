; DESCRIPTION: Draws a white rectangle at (265, 133) with width 83 and height 104.
; PLAN: r0=265(x), r1=133(y), r2=83(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 133
LDI r2, 83
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
