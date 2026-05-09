; DESCRIPTION: Composite: Places a black dot at position (76, 183) then Places a purple line segment connecting (249, 199) to (293, 245).
; PLAN: r0=76(x), r1=183(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=249(x1), r6=199(y1), r7=293(x2), r8=245(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 76
LDI r1, 183
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 249
LDI r6, 199
LDI r7, 293
LDI r8, 245
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
