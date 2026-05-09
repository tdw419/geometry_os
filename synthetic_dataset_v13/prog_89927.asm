; DESCRIPTION: Composite: Creates a green circular shape at (47, 87) with radius 46 then Sets a single cyan pixel at (324, 59).
; PLAN: r0=47(x), r1=87(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=324(x), r6=59(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 47
LDI r1, 87
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 324
LDI r6, 59
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
