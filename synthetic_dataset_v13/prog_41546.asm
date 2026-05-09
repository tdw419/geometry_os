; DESCRIPTION: Composite: Renders a red disk with center (136, 160) and radius 44 then Places a white dot at position (219, 145).
; PLAN: r0=136(x), r1=160(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=219(x), r6=145(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 136
LDI r1, 160
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 219
LDI r6, 145
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
