; DESCRIPTION: Composite: Creates a cyan circular shape at (296, 137) with radius 66 then Sets a single orange pixel at (114, 163).
; PLAN: r0=296(x), r1=137(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=114(x), r6=163(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 296
LDI r1, 137
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 114
LDI r6, 163
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
