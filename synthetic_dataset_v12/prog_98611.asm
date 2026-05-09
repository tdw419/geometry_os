; DESCRIPTION: Composite: Places a orange circle of radius 71 at center (201, 99) then Places a purple dot at position (263, 153).
; PLAN: r0=201(x), r1=99(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=263(x), r6=153(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 201
LDI r1, 99
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 263
LDI r6, 153
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
