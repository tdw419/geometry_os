; DESCRIPTION: Composite: Renders a purple disk with center (452, 147) and radius 38 then Places a white dot at position (35, 89).
; PLAN: r0=452(x), r1=147(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=35(x), r6=89(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 452
LDI r1, 147
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 35
LDI r6, 89
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
