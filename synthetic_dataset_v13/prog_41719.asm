; DESCRIPTION: Draws a white rectangle at (336, 33) with width 58 and height 17.
; PLAN: r0=336(x), r1=33(y), r2=58(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 33
LDI r2, 58
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
