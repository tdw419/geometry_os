; DESCRIPTION: Composite: Creates a green circular shape at (378, 175) with radius 79 then Places a cyan dot at position (503, 5).
; PLAN: r0=378(x), r1=175(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=503(x), r6=5(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 378
LDI r1, 175
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 503
LDI r6, 5
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
