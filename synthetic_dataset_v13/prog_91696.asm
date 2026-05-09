; DESCRIPTION: Composite: Places a orange circle of radius 25 at center (129, 115) then Sets a single orange pixel at (283, 54).
; PLAN: r0=129(x), r1=115(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x), r6=54(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 129
LDI r1, 115
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 54
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
