; DESCRIPTION: Composite: Places a cyan circle of radius 43 at center (309, 80) then Places a purple dot at position (71, 163).
; PLAN: r0=309(x), r1=80(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=71(x), r6=163(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 309
LDI r1, 80
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 71
LDI r6, 163
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
