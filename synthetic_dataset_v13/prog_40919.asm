; DESCRIPTION: Composite: Places a white dot at position (37, 174) then Places a green circle of radius 15 at center (439, 190).
; PLAN: r0=37(x), r1=174(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=439(x), r6=190(y), r7=15(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 37
LDI r1, 174
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 439
LDI r6, 190
LDI r7, 15
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
