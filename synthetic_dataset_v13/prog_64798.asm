; DESCRIPTION: Composite: Places a orange circle of radius 32 at center (185, 114) then Sets a single red pixel at (23, 145).
; PLAN: r0=185(x), r1=114(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=23(x), r6=145(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 185
LDI r1, 114
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 23
LDI r6, 145
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
