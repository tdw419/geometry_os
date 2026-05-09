; DESCRIPTION: Composite: Creates a red circular shape at (141, 113) with radius 49 then Sets a single blue pixel at (363, 121).
; PLAN: r0=141(x), r1=113(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=363(x), r6=121(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 141
LDI r1, 113
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 363
LDI r6, 121
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
