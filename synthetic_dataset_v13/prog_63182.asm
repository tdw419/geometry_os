; DESCRIPTION: Places a orange circle of radius 69 at center (439, 137).
; PLAN: r0=439(x), r1=137(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 137
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
