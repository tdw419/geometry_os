; DESCRIPTION: Composite: Sets a single cyan pixel at (129, 107) then Places a black circle of radius 25 at center (324, 74).
; PLAN: r0=129(x), r1=107(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=324(x), r6=74(y), r7=25(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 129
LDI r1, 107
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 324
LDI r6, 74
LDI r7, 25
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
