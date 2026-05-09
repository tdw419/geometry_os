; DESCRIPTION: Composite: Places a white dot at position (403, 147) then Creates a yellow circular shape at (314, 201) with radius 30.
; PLAN: r0=403(x), r1=147(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=314(x), r6=201(y), r7=30(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 403
LDI r1, 147
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 314
LDI r6, 201
LDI r7, 30
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
