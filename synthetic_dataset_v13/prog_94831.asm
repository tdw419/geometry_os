; DESCRIPTION: Places a orange circle of radius 13 at center (414, 178).
; PLAN: r0=414(x), r1=178(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 178
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
