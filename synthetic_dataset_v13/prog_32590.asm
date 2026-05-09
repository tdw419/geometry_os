; DESCRIPTION: Composite: Places a cyan circle of radius 45 at center (165, 159) then Places a cyan dot at position (289, 105).
; PLAN: r0=165(x), r1=159(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=289(x), r6=105(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 165
LDI r1, 159
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 289
LDI r6, 105
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
