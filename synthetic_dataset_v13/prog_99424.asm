; DESCRIPTION: Composite: Creates a yellow circular shape at (85, 58) with radius 51 then Places a purple dot at position (44, 219).
; PLAN: r0=85(x), r1=58(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=44(x), r6=219(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 85
LDI r1, 58
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 44
LDI r6, 219
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
