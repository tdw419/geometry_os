; DESCRIPTION: Composite: Places a purple circle of radius 24 at center (484, 224) then Sets a single purple pixel at (446, 6).
; PLAN: r0=484(x), r1=224(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x), r6=6(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 484
LDI r1, 224
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 6
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
