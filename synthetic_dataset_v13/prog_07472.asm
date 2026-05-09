; DESCRIPTION: Composite: Places a yellow dot at position (391, 63) then Places a green circle of radius 80 at center (141, 102).
; PLAN: r0=391(x), r1=63(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=141(x), r6=102(y), r7=80(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 391
LDI r1, 63
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 141
LDI r6, 102
LDI r7, 80
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
