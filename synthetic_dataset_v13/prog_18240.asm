; DESCRIPTION: Places a orange circle of radius 57 at center (351, 58).
; PLAN: r0=351(x), r1=58(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 58
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
