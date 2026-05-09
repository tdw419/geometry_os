; DESCRIPTION: Composite: Places a orange circle of radius 41 at center (422, 115) then Sets a single red pixel at (166, 218).
; PLAN: r0=422(x), r1=115(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x), r6=218(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 422
LDI r1, 115
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 218
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
