; DESCRIPTION: Draws a white rectangle at (400, 121) with width 83 and height 13.
; PLAN: r0=400(x), r1=121(y), r2=83(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 121
LDI r2, 83
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
