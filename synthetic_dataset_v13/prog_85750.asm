; DESCRIPTION: Composite: Draws a black circle centered at (211, 78) with radius 56 then Places a purple dot at position (356, 193).
; PLAN: r0=211(x), r1=78(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=356(x), r6=193(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 211
LDI r1, 78
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 356
LDI r6, 193
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
