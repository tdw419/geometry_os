; DESCRIPTION: Composite: Renders a purple disk with center (442, 79) and radius 38 then Places a blue dot at position (109, 51).
; PLAN: r0=442(x), r1=79(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x), r6=51(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 442
LDI r1, 79
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 51
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
