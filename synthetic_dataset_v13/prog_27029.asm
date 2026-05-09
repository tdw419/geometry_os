; DESCRIPTION: Places a orange circle of radius 18 at center (266, 45).
; PLAN: r0=266(x), r1=45(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 45
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
