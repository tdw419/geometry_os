; DESCRIPTION: Composite: Sets a single red pixel at (430, 201) then Draws a black circle centered at (247, 152) with radius 17.
; PLAN: r0=430(x), r1=201(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=247(x), r6=152(y), r7=17(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 430
LDI r1, 201
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 247
LDI r6, 152
LDI r7, 17
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
