; DESCRIPTION: Composite: Draws a purple circle centered at (289, 102) with radius 51 then Places a red dot at position (423, 55).
; PLAN: r0=289(x), r1=102(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=423(x), r6=55(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 289
LDI r1, 102
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 423
LDI r6, 55
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
