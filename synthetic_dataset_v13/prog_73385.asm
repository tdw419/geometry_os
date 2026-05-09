; DESCRIPTION: Composite: Creates a purple circular shape at (314, 79) with radius 30 then Places a yellow dot at position (176, 141).
; PLAN: r0=314(x), r1=79(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=176(x), r6=141(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 314
LDI r1, 79
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 176
LDI r6, 141
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
