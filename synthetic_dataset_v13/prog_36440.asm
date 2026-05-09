; DESCRIPTION: Composite: Renders a yellow box of size 17x119 starting at (262, 131) then Sets a single purple pixel at (484, 44).
; PLAN: r0=262(x), r1=131(y), r2=17(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=484(x), r6=44(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 262
LDI r1, 131
LDI r2, 17
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 44
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
