; DESCRIPTION: Composite: Places a black circle of radius 57 at center (257, 71) then Sets a single orange pixel at (384, 97).
; PLAN: r0=257(x), r1=71(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=384(x), r6=97(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 257
LDI r1, 71
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 384
LDI r6, 97
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
