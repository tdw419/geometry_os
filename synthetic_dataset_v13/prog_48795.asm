; DESCRIPTION: Composite: Places a purple circle of radius 36 at center (86, 56) then Sets a single purple pixel at (432, 146).
; PLAN: r0=86(x), r1=56(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=432(x), r6=146(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 86
LDI r1, 56
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 432
LDI r6, 146
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
