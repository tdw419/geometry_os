; DESCRIPTION: Composite: Sets a single purple pixel at (96, 180) then Creates a purple circular shape at (416, 123) with radius 62.
; PLAN: r0=96(x), r1=180(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=416(x), r6=123(y), r7=62(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 96
LDI r1, 180
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 416
LDI r6, 123
LDI r7, 62
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
