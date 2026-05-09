; DESCRIPTION: Composite: Creates a purple circular shape at (251, 159) with radius 70 then Sets a single purple pixel at (413, 154).
; PLAN: r0=251(x), r1=159(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=413(x), r6=154(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 251
LDI r1, 159
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 413
LDI r6, 154
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
