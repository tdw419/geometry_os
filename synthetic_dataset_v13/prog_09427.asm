; DESCRIPTION: Draws a white rectangle at (218, 115) with width 49 and height 17.
; PLAN: r0=218(x), r1=115(y), r2=49(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 115
LDI r2, 49
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
