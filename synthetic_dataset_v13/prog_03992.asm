; DESCRIPTION: Composite: Places a cyan dot at position (461, 105) then Places a red circle of radius 29 at center (257, 160).
; PLAN: r0=461(x), r1=105(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=257(x), r6=160(y), r7=29(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 461
LDI r1, 105
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 257
LDI r6, 160
LDI r7, 29
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
