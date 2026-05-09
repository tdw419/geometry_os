; DESCRIPTION: Places a orange circle of radius 27 at center (102, 201).
; PLAN: r0=102(x), r1=201(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 201
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
