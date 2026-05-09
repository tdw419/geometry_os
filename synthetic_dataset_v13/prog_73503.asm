; DESCRIPTION: Composite: Places a purple dot at position (17, 144) then Places a green circle of radius 21 at center (483, 90).
; PLAN: r0=17(x), r1=144(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=483(x), r6=90(y), r7=21(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 17
LDI r1, 144
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 483
LDI r6, 90
LDI r7, 21
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
