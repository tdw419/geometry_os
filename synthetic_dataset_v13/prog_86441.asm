; DESCRIPTION: Places a orange circle of radius 37 at center (312, 68).
; PLAN: r0=312(x), r1=68(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 68
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
