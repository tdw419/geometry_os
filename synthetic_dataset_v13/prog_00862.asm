; DESCRIPTION: Composite: Places a cyan dot at position (245, 184) then Creates a black circular shape at (381, 103) with radius 60.
; PLAN: r0=245(x), r1=184(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=381(x), r6=103(y), r7=60(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 245
LDI r1, 184
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 381
LDI r6, 103
LDI r7, 60
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
