; DESCRIPTION: Composite: Places a black dot at position (31, 218) then Places a black circle of radius 62 at center (268, 161).
; PLAN: r0=31(x), r1=218(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=268(x), r6=161(y), r7=62(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 31
LDI r1, 218
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 268
LDI r6, 161
LDI r7, 62
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
