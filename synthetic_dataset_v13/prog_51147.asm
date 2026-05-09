; DESCRIPTION: Composite: Creates a purple circular shape at (129, 128) with radius 37 then Sets a single cyan pixel at (82, 4).
; PLAN: r0=129(x), r1=128(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=82(x), r6=4(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 129
LDI r1, 128
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 82
LDI r6, 4
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
