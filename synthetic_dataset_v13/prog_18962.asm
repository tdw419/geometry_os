; DESCRIPTION: Composite: Creates a cyan circular shape at (390, 80) with radius 68 then Sets a single purple pixel at (271, 234).
; PLAN: r0=390(x), r1=80(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=271(x), r6=234(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 390
LDI r1, 80
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 271
LDI r6, 234
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
