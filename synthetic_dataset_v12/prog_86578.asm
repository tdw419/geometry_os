; DESCRIPTION: Composite: Places a orange circle of radius 18 at center (195, 149) then Sets a single cyan pixel at (133, 111).
; PLAN: r0=195(x), r1=149(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=133(x), r6=111(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 195
LDI r1, 149
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 133
LDI r6, 111
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
