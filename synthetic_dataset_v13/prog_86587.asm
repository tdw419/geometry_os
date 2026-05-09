; DESCRIPTION: Composite: Places a white circle of radius 75 at center (282, 167) then Places a purple dot at position (351, 90).
; PLAN: r0=282(x), r1=167(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=351(x), r6=90(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 282
LDI r1, 167
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 351
LDI r6, 90
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
