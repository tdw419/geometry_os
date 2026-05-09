; DESCRIPTION: Composite: Sets a single cyan pixel at (367, 80) then Places a green circle of radius 66 at center (439, 109).
; PLAN: r0=367(x), r1=80(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=439(x), r6=109(y), r7=66(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 367
LDI r1, 80
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 439
LDI r6, 109
LDI r7, 66
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
