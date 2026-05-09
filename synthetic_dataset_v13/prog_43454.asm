; DESCRIPTION: Composite: Places a green circle of radius 36 at center (268, 158) then Places a cyan dot at position (441, 120).
; PLAN: r0=268(x), r1=158(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=441(x), r6=120(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 268
LDI r1, 158
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 441
LDI r6, 120
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
