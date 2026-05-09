; DESCRIPTION: Composite: Places a cyan circle of radius 49 at center (203, 83) then Sets a single black pixel at (246, 75).
; PLAN: r0=203(x), r1=83(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=246(x), r6=75(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 203
LDI r1, 83
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 246
LDI r6, 75
LDI r7, 0x000000
PSET r5, r6, r7
HALT
