; DESCRIPTION: Composite: Creates a blue circular shape at (441, 157) with radius 20 then Places a purple dot at position (268, 153).
; PLAN: r0=441(x), r1=157(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=268(x), r6=153(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 441
LDI r1, 157
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 268
LDI r6, 153
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
