; DESCRIPTION: Draws a white rectangle at (289, 31) with width 83 and height 80.
; PLAN: r0=289(x), r1=31(y), r2=83(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 31
LDI r2, 83
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
