; DESCRIPTION: Composite: Sets a single black pixel at (483, 101) then Places a green circle of radius 72 at center (197, 144).
; PLAN: r0=483(x), r1=101(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=197(x), r6=144(y), r7=72(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 483
LDI r1, 101
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 197
LDI r6, 144
LDI r7, 72
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
