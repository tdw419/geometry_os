; DESCRIPTION: Composite: Sets a single black pixel at (393, 143) then Places a red circle of radius 11 at center (377, 23).
; PLAN: r0=393(x), r1=143(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=377(x), r6=23(y), r7=11(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 393
LDI r1, 143
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 377
LDI r6, 23
LDI r7, 11
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
