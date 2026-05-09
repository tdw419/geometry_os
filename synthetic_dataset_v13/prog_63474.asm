; DESCRIPTION: Composite: Places a yellow circle of radius 23 at center (422, 95) then Sets a single yellow pixel at (124, 208).
; PLAN: r0=422(x), r1=95(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=124(x), r6=208(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 422
LDI r1, 95
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 124
LDI r6, 208
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
