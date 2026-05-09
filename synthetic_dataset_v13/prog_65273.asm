; DESCRIPTION: Composite: Places a yellow dot at position (211, 155) then Places a green circle of radius 42 at center (140, 124).
; PLAN: r0=211(x), r1=155(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=140(x), r6=124(y), r7=42(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 211
LDI r1, 155
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 140
LDI r6, 124
LDI r7, 42
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
