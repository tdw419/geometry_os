; DESCRIPTION: Composite: Sets a single green pixel at (75, 82) then Places a cyan circle of radius 35 at center (323, 195).
; PLAN: r0=75(x), r1=82(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=323(x), r6=195(y), r7=35(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 75
LDI r1, 82
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 323
LDI r6, 195
LDI r7, 35
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
