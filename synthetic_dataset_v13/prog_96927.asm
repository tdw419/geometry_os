; DESCRIPTION: Composite: Sets a single blue pixel at (50, 66) then Places a purple circle of radius 17 at center (194, 236).
; PLAN: r0=50(x), r1=66(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=194(x), r6=236(y), r7=17(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 50
LDI r1, 66
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 194
LDI r6, 236
LDI r7, 17
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
