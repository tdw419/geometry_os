; DESCRIPTION: Places a orange circle of radius 24 at center (478, 35).
; PLAN: r0=478(x), r1=35(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 478
LDI r1, 35
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
