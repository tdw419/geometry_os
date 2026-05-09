; DESCRIPTION: Composite: Renders a purple disk with center (220, 97) and radius 76 then Places a cyan dot at position (471, 82).
; PLAN: r0=220(x), r1=97(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=471(x), r6=82(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 220
LDI r1, 97
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 471
LDI r6, 82
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
