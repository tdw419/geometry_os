; DESCRIPTION: Composite: Sets a single purple pixel at (147, 98) then Places a cyan circle of radius 33 at center (257, 86).
; PLAN: r0=147(x), r1=98(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=257(x), r6=86(y), r7=33(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 147
LDI r1, 98
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 257
LDI r6, 86
LDI r7, 33
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
