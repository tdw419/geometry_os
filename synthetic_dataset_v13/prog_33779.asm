; DESCRIPTION: Composite: Sets a single green pixel at (372, 108) then Creates a black circular shape at (241, 122) with radius 30.
; PLAN: r0=372(x), r1=108(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=241(x), r6=122(y), r7=30(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 372
LDI r1, 108
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 241
LDI r6, 122
LDI r7, 30
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
