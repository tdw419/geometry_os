; DESCRIPTION: Composite: Renders a white disk with center (405, 121) and radius 75 then Places a cyan dot at position (378, 116).
; PLAN: r0=405(x), r1=121(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=378(x), r6=116(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 405
LDI r1, 121
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 378
LDI r6, 116
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
