; DESCRIPTION: Composite: Places a cyan dot at position (322, 2) then Creates a orange circular shape at (202, 92) with radius 49.
; PLAN: r0=322(x), r1=2(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=92(y), r7=49(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 322
LDI r1, 2
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 202
LDI r6, 92
LDI r7, 49
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
