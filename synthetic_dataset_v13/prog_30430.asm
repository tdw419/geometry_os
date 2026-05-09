; DESCRIPTION: Composite: Renders a white disk with center (454, 106) and radius 11 then Places a cyan dot at position (498, 248).
; PLAN: r0=454(x), r1=106(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=498(x), r6=248(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 454
LDI r1, 106
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 498
LDI r6, 248
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
