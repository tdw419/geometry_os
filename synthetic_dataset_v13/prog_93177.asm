; DESCRIPTION: Draws a white rectangle at (117, 120) with width 43 and height 104.
; PLAN: r0=117(x), r1=120(y), r2=43(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 120
LDI r2, 43
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
