; DESCRIPTION: Composite: Places a cyan dot at position (245, 237) then Creates a cyan circular shape at (140, 82) with radius 64.
; PLAN: r0=245(x), r1=237(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=140(x), r6=82(y), r7=64(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 245
LDI r1, 237
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 140
LDI r6, 82
LDI r7, 64
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
