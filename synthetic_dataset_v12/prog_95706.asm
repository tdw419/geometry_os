; DESCRIPTION: Places a orange circle of radius 45 at center (439, 49).
; PLAN: r0=439(x), r1=49(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 49
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
