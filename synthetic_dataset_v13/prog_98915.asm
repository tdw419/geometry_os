; DESCRIPTION: Composite: Places a black dot at position (297, 71) then Creates a black circular shape at (299, 173) with radius 37.
; PLAN: r0=297(x), r1=71(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=299(x), r6=173(y), r7=37(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 297
LDI r1, 71
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 299
LDI r6, 173
LDI r7, 37
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
