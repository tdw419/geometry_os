; DESCRIPTION: Composite: Places a cyan 51x61 rectangle at position (378, 66) then Sets a single blue pixel at (478, 47).
; PLAN: r0=378(x), r1=66(y), r2=51(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=478(x), r6=47(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 378
LDI r1, 66
LDI r2, 51
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 47
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
