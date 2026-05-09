; DESCRIPTION: Composite: Places a purple circle of radius 36 at center (292, 156) then Places a black dot at position (311, 170).
; PLAN: r0=292(x), r1=156(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=311(x), r6=170(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 292
LDI r1, 156
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 311
LDI r6, 170
LDI r7, 0x000000
PSET r5, r6, r7
HALT
