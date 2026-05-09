; DESCRIPTION: Composite: Creates a black circular shape at (225, 39) with radius 20 then Sets a single green pixel at (296, 7).
; PLAN: r0=225(x), r1=39(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=296(x), r6=7(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 225
LDI r1, 39
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 296
LDI r6, 7
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
