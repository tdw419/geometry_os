; DESCRIPTION: Composite: Places a black circle of radius 73 at center (253, 135) then Places a purple dot at position (418, 57).
; PLAN: r0=253(x), r1=135(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=418(x), r6=57(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 253
LDI r1, 135
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 418
LDI r6, 57
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
