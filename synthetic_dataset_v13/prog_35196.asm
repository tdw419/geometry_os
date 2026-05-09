; DESCRIPTION: Creates a yellow rectangular region at (351, 147) spanning 53 by 66 pixels.
; PLAN: r0=351(x), r1=147(y), r2=53(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 147
LDI r2, 53
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
