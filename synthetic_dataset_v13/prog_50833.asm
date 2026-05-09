; DESCRIPTION: Composite: Renders a black disk with center (489, 227) and radius 18 then Places a white dot at position (150, 93).
; PLAN: r0=489(x), r1=227(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=150(x), r6=93(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 489
LDI r1, 227
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 150
LDI r6, 93
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
