; DESCRIPTION: Composite: Draws a green circle centered at (373, 104) with radius 55 then Sets a single yellow pixel at (187, 201).
; PLAN: r0=373(x), r1=104(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=187(x), r6=201(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 373
LDI r1, 104
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 187
LDI r6, 201
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
