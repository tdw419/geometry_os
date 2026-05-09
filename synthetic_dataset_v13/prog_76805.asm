; DESCRIPTION: Composite: Places a green circle of radius 42 at center (151, 124) then Sets a single blue pixel at (260, 102).
; PLAN: r0=151(x), r1=124(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=260(x), r6=102(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 151
LDI r1, 124
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 260
LDI r6, 102
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
