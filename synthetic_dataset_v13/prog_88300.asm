; DESCRIPTION: Composite: Sets a single red pixel at (506, 150) then Creates a white circular shape at (418, 165) with radius 71.
; PLAN: r0=506(x), r1=150(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=418(x), r6=165(y), r7=71(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 506
LDI r1, 150
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 418
LDI r6, 165
LDI r7, 71
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
