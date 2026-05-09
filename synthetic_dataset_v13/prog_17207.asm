; DESCRIPTION: Composite: Draws a purple circle centered at (345, 171) with radius 80 then Places a black dot at position (393, 52).
; PLAN: r0=345(x), r1=171(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=393(x), r6=52(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 345
LDI r1, 171
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 393
LDI r6, 52
LDI r7, 0x000000
PSET r5, r6, r7
HALT
