; DESCRIPTION: Places a orange circle of radius 56 at center (76, 130).
; PLAN: r0=76(x), r1=130(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 130
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
