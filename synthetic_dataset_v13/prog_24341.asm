; DESCRIPTION: Composite: Creates a purple circular shape at (383, 175) with radius 27 then Sets a single white pixel at (432, 15).
; PLAN: r0=383(x), r1=175(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=432(x), r6=15(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 383
LDI r1, 175
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 432
LDI r6, 15
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
