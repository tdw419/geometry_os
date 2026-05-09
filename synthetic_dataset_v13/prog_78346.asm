; DESCRIPTION: Composite: Renders a black disk with center (312, 171) and radius 60 then Sets a single orange pixel at (218, 131).
; PLAN: r0=312(x), r1=171(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=218(x), r6=131(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 312
LDI r1, 171
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 218
LDI r6, 131
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
