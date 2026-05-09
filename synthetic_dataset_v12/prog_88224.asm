; DESCRIPTION: Draws a white rectangle at (351, 53) with width 87 and height 33.
; PLAN: r0=351(x), r1=53(y), r2=87(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 53
LDI r2, 87
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
