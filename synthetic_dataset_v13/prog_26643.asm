; DESCRIPTION: Composite: Renders a purple disk with center (164, 109) and radius 47 then Places a black dot at position (437, 32).
; PLAN: r0=164(x), r1=109(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=437(x), r6=32(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 164
LDI r1, 109
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 437
LDI r6, 32
LDI r7, 0x000000
PSET r5, r6, r7
HALT
