; DESCRIPTION: Composite: Creates a magenta circular shape at (407, 80) with radius 49 then Sets a single orange pixel at (373, 123).
; PLAN: r0=407(x), r1=80(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=373(x), r6=123(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 407
LDI r1, 80
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 373
LDI r6, 123
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
