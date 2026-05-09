; DESCRIPTION: Composite: Places a purple dot at position (374, 63) then Creates a green circular shape at (439, 156) with radius 71.
; PLAN: r0=374(x), r1=63(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=439(x), r6=156(y), r7=71(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 374
LDI r1, 63
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 439
LDI r6, 156
LDI r7, 71
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
