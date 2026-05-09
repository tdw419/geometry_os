; DESCRIPTION: Composite: Renders a white disk with center (257, 209) and radius 12 then Places a purple dot at position (508, 52).
; PLAN: r0=257(x), r1=209(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=508(x), r6=52(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 257
LDI r1, 209
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 508
LDI r6, 52
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
