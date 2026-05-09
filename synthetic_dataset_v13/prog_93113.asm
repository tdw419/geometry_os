; DESCRIPTION: Composite: Sets a single purple pixel at (278, 77) then Places a purple circle of radius 30 at center (407, 42).
; PLAN: r0=278(x), r1=77(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=407(x), r6=42(y), r7=30(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 278
LDI r1, 77
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 407
LDI r6, 42
LDI r7, 30
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
