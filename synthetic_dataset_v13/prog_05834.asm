; DESCRIPTION: Composite: Draws a green circle centered at (181, 158) with radius 51 then Places a purple dot at position (425, 66).
; PLAN: r0=181(x), r1=158(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=425(x), r6=66(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 181
LDI r1, 158
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 425
LDI r6, 66
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
