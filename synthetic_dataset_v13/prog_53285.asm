; DESCRIPTION: Composite: Places a blue dot at position (484, 190) then Places a purple circle of radius 45 at center (385, 48).
; PLAN: r0=484(x), r1=190(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=385(x), r6=48(y), r7=45(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 484
LDI r1, 190
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 385
LDI r6, 48
LDI r7, 45
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
