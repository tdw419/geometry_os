; DESCRIPTION: Composite: Places a black dot at position (267, 61) then Creates a cyan circular shape at (299, 147) with radius 52.
; PLAN: r0=267(x), r1=61(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=299(x), r6=147(y), r7=52(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 267
LDI r1, 61
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 299
LDI r6, 147
LDI r7, 52
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
