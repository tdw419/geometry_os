; DESCRIPTION: Composite: Creates a yellow circular shape at (367, 129) with radius 19 then Sets a single yellow pixel at (424, 142).
; PLAN: r0=367(x), r1=129(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=424(x), r6=142(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 367
LDI r1, 129
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 424
LDI r6, 142
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
