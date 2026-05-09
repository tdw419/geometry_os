; DESCRIPTION: Composite: Creates a cyan circular shape at (396, 86) with radius 61 then Sets a single yellow pixel at (248, 139).
; PLAN: r0=396(x), r1=86(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=248(x), r6=139(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 396
LDI r1, 86
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 248
LDI r6, 139
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
