; DESCRIPTION: Places a orange circle of radius 36 at center (142, 45).
; PLAN: r0=142(x), r1=45(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 45
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
