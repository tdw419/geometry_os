; DESCRIPTION: Composite: Renders a black disk with center (401, 170) and radius 37 then Sets a single red pixel at (475, 207).
; PLAN: r0=401(x), r1=170(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=475(x), r6=207(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 401
LDI r1, 170
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 475
LDI r6, 207
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
