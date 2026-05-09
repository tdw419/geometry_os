; DESCRIPTION: Draws a white rectangle at (164, 97) with width 75 and height 104.
; PLAN: r0=164(x), r1=97(y), r2=75(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 97
LDI r2, 75
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
