; DESCRIPTION: Composite: Places a purple dot at position (94, 232) then Renders a purple disk with center (372, 158) and radius 53.
; PLAN: r0=94(x), r1=232(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=372(x), r6=158(y), r7=53(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 94
LDI r1, 232
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 372
LDI r6, 158
LDI r7, 53
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
