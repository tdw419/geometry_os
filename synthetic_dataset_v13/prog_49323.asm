; DESCRIPTION: Composite: Creates a yellow circular shape at (432, 133) with radius 55 then Sets a single black pixel at (157, 54).
; PLAN: r0=432(x), r1=133(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=157(x), r6=54(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 432
LDI r1, 133
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 157
LDI r6, 54
LDI r7, 0x000000
PSET r5, r6, r7
HALT
