; DESCRIPTION: Draws a white rectangle at (220, 84) with width 19 and height 104.
; PLAN: r0=220(x), r1=84(y), r2=19(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 84
LDI r2, 19
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
