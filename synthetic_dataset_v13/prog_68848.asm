; DESCRIPTION: Composite: Creates a purple circular shape at (431, 80) with radius 76 then Places a orange dot at position (432, 85).
; PLAN: r0=431(x), r1=80(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=432(x), r6=85(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 431
LDI r1, 80
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 432
LDI r6, 85
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
