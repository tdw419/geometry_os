; DESCRIPTION: Composite: Places a orange circle of radius 45 at center (421, 144) then Sets a single white pixel at (25, 201).
; PLAN: r0=421(x), r1=144(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=25(x), r6=201(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 421
LDI r1, 144
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 25
LDI r6, 201
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
