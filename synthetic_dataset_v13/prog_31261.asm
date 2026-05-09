; DESCRIPTION: Composite: Creates a black circular shape at (326, 154) with radius 35 then Sets a single cyan pixel at (45, 217).
; PLAN: r0=326(x), r1=154(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=45(x), r6=217(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 326
LDI r1, 154
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 45
LDI r6, 217
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
