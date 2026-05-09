; DESCRIPTION: Composite: Places a cyan circle of radius 49 at center (316, 98) then Sets a single red pixel at (405, 134).
; PLAN: r0=316(x), r1=98(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=405(x), r6=134(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 316
LDI r1, 98
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 405
LDI r6, 134
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
