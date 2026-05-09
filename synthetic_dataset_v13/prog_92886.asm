; DESCRIPTION: Composite: Creates a orange circular shape at (417, 136) with radius 70 then Sets a single cyan pixel at (309, 35).
; PLAN: r0=417(x), r1=136(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=309(x), r6=35(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 417
LDI r1, 136
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 309
LDI r6, 35
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
