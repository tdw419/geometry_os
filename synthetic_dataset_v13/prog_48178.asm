; DESCRIPTION: Composite: Places a purple circle of radius 71 at center (440, 96) then Places a black dot at position (47, 106).
; PLAN: r0=440(x), r1=96(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=47(x), r6=106(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 440
LDI r1, 96
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 47
LDI r6, 106
LDI r7, 0x000000
PSET r5, r6, r7
HALT
