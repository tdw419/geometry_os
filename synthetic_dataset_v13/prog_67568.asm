; DESCRIPTION: Composite: Places a cyan circle of radius 77 at center (109, 104) then Places a purple dot at position (493, 107).
; PLAN: r0=109(x), r1=104(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=493(x), r6=107(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 109
LDI r1, 104
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 493
LDI r6, 107
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
