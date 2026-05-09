; DESCRIPTION: Composite: Places a purple dot at position (379, 115) then Creates a orange circular shape at (200, 41) with radius 34.
; PLAN: r0=379(x), r1=115(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=200(x), r6=41(y), r7=34(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 379
LDI r1, 115
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 200
LDI r6, 41
LDI r7, 34
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
