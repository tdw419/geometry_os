; DESCRIPTION: Composite: Places a black circle of radius 57 at center (287, 92) then Places a cyan dot at position (155, 162).
; PLAN: r0=287(x), r1=92(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=155(x), r6=162(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 287
LDI r1, 92
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 155
LDI r6, 162
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
