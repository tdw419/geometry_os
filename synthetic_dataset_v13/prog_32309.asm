; DESCRIPTION: Composite: Sets a single orange pixel at (24, 27) then Places a cyan circle of radius 40 at center (322, 94).
; PLAN: r0=24(x), r1=27(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=322(x), r6=94(y), r7=40(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 24
LDI r1, 27
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 322
LDI r6, 94
LDI r7, 40
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
