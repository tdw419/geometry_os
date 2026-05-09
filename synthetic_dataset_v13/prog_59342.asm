; DESCRIPTION: Composite: Sets a single black pixel at (103, 194) then Places a purple circle of radius 39 at center (71, 48).
; PLAN: r0=103(x), r1=194(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=71(x), r6=48(y), r7=39(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 103
LDI r1, 194
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 71
LDI r6, 48
LDI r7, 39
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
