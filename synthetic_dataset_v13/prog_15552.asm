; DESCRIPTION: Composite: Sets a single black pixel at (468, 69) then Creates a purple circular shape at (175, 161) with radius 35.
; PLAN: r0=468(x), r1=69(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=175(x), r6=161(y), r7=35(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 468
LDI r1, 69
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 175
LDI r6, 161
LDI r7, 35
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
