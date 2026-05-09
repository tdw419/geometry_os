; DESCRIPTION: Draws a white rectangle at (344, 44) with width 88 and height 31.
; PLAN: r0=344(x), r1=44(y), r2=88(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 44
LDI r2, 88
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
