; DESCRIPTION: Composite: Sets a single black pixel at (452, 128) then Renders a white disk with center (389, 157) and radius 52.
; PLAN: r0=452(x), r1=128(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=389(x), r6=157(y), r7=52(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 452
LDI r1, 128
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 389
LDI r6, 157
LDI r7, 52
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
