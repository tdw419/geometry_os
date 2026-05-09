; DESCRIPTION: Composite: Creates a purple circular shape at (111, 106) with radius 75 then Sets a single white pixel at (224, 192).
; PLAN: r0=111(x), r1=106(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=224(x), r6=192(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 111
LDI r1, 106
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 224
LDI r6, 192
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
