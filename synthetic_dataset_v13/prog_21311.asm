; DESCRIPTION: Composite: Places a black circle of radius 21 at center (149, 25) then Places a purple dot at position (393, 157).
; PLAN: r0=149(x), r1=25(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=393(x), r6=157(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 149
LDI r1, 25
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 393
LDI r6, 157
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
