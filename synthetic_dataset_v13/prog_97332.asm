; DESCRIPTION: Composite: Sets a single blue pixel at (91, 142) then Creates a purple circular shape at (387, 182) with radius 28.
; PLAN: r0=91(x), r1=142(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=387(x), r6=182(y), r7=28(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 91
LDI r1, 142
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 387
LDI r6, 182
LDI r7, 28
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
