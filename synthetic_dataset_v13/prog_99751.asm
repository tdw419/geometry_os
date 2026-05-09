; DESCRIPTION: Places a orange circle of radius 11 at center (139, 194).
; PLAN: r0=139(x), r1=194(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 194
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
