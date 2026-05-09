; DESCRIPTION: Composite: Places a black dot at position (129, 94) then Creates a purple circular shape at (429, 28) with radius 21.
; PLAN: r0=129(x), r1=94(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=429(x), r6=28(y), r7=21(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 129
LDI r1, 94
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 429
LDI r6, 28
LDI r7, 21
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
