; DESCRIPTION: Composite: Places a orange circle of radius 26 at center (75, 177) then Sets a single orange pixel at (495, 87).
; PLAN: r0=75(x), r1=177(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=495(x), r6=87(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 75
LDI r1, 177
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 495
LDI r6, 87
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
