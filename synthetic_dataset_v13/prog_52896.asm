; DESCRIPTION: Composite: Sets a single cyan pixel at (449, 85) then Places a black circle of radius 45 at center (217, 136).
; PLAN: r0=449(x), r1=85(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=217(x), r6=136(y), r7=45(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 449
LDI r1, 85
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 217
LDI r6, 136
LDI r7, 45
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
