; DESCRIPTION: Composite: Places a cyan circle of radius 71 at center (322, 96) then Places a yellow dot at position (308, 102).
; PLAN: r0=322(x), r1=96(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=308(x), r6=102(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 322
LDI r1, 96
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 308
LDI r6, 102
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
