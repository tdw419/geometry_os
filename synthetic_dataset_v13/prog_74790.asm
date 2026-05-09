; DESCRIPTION: Composite: Renders a orange disk with center (422, 163) and radius 47 then Sets a single orange pixel at (346, 23).
; PLAN: r0=422(x), r1=163(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x), r6=23(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 422
LDI r1, 163
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 23
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
