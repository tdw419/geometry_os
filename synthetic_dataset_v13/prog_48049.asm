; DESCRIPTION: Draws a white rectangle at (346, 104) with width 80 and height 63.
; PLAN: r0=346(x), r1=104(y), r2=80(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 104
LDI r2, 80
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
