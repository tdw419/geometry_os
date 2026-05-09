; DESCRIPTION: Composite: Places a purple dot at position (492, 185) then Creates a purple circular shape at (316, 180) with radius 55.
; PLAN: r0=492(x), r1=185(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=316(x), r6=180(y), r7=55(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 492
LDI r1, 185
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 316
LDI r6, 180
LDI r7, 55
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
