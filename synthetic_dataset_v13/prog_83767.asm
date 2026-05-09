; DESCRIPTION: Composite: Creates a yellow circular shape at (27, 237) with radius 12 then Places a cyan dot at position (427, 19).
; PLAN: r0=27(x), r1=237(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=427(x), r6=19(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 27
LDI r1, 237
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 427
LDI r6, 19
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
