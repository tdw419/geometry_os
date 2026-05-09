; DESCRIPTION: Composite: Creates a black circular shape at (274, 135) with radius 34 then Sets a single green pixel at (431, 43).
; PLAN: r0=274(x), r1=135(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x), r6=43(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 274
LDI r1, 135
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 43
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
