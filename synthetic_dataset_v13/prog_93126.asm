; DESCRIPTION: Composite: Renders a black disk with center (356, 151) and radius 78 then Places a purple dot at position (476, 87).
; PLAN: r0=356(x), r1=151(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=476(x), r6=87(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 356
LDI r1, 151
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 476
LDI r6, 87
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
