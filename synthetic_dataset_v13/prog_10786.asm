; DESCRIPTION: Composite: Places a purple circle of radius 54 at center (321, 93) then Places a purple dot at position (272, 56).
; PLAN: r0=321(x), r1=93(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=272(x), r6=56(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 321
LDI r1, 93
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 272
LDI r6, 56
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
