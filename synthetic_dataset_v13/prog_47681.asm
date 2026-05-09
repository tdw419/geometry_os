; DESCRIPTION: Composite: Creates a green circular shape at (394, 124) with radius 56 then Sets a single black pixel at (400, 195).
; PLAN: r0=394(x), r1=124(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=400(x), r6=195(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 394
LDI r1, 124
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 400
LDI r6, 195
LDI r7, 0x000000
PSET r5, r6, r7
HALT
