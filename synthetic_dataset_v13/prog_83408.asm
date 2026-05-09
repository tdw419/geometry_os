; DESCRIPTION: Composite: Renders a green disk with center (407, 124) and radius 30 then Places a purple dot at position (75, 57).
; PLAN: r0=407(x), r1=124(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=75(x), r6=57(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 407
LDI r1, 124
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 75
LDI r6, 57
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
