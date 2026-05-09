; DESCRIPTION: Draws a white rectangle at (276, 58) with width 29 and height 119.
; PLAN: r0=276(x), r1=58(y), r2=29(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 58
LDI r2, 29
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
