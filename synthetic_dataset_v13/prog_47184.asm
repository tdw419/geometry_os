; DESCRIPTION: Composite: Places a yellow circle of radius 11 at center (336, 28) then Sets a single purple pixel at (120, 52).
; PLAN: r0=336(x), r1=28(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x), r6=52(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 336
LDI r1, 28
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 52
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
