; DESCRIPTION: Composite: Creates a purple circular shape at (351, 32) with radius 24 then Places a purple dot at position (462, 76).
; PLAN: r0=351(x), r1=32(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=462(x), r6=76(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 351
LDI r1, 32
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 462
LDI r6, 76
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
