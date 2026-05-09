; DESCRIPTION: Places a orange circle of radius 38 at center (95, 201).
; PLAN: r0=95(x), r1=201(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 201
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
