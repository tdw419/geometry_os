; DESCRIPTION: Composite: Sets a single black pixel at (248, 119) then Places a yellow circle of radius 52 at center (354, 101).
; PLAN: r0=248(x), r1=119(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=354(x), r6=101(y), r7=52(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 248
LDI r1, 119
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 354
LDI r6, 101
LDI r7, 52
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
