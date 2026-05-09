; DESCRIPTION: Composite: Places a black circle of radius 60 at center (121, 115) then Sets a single black pixel at (506, 253).
; PLAN: r0=121(x), r1=115(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=506(x), r6=253(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 121
LDI r1, 115
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 506
LDI r6, 253
LDI r7, 0x000000
PSET r5, r6, r7
HALT
