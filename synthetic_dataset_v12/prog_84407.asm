; DESCRIPTION: Composite: Renders a black disk with center (332, 105) and radius 69 then Places a magenta dot at position (51, 237).
; PLAN: r0=332(x), r1=105(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=51(x), r6=237(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 332
LDI r1, 105
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 51
LDI r6, 237
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
