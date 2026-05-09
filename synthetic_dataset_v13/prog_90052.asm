; DESCRIPTION: Composite: Places a yellow circle of radius 34 at center (59, 85) then Sets a single purple pixel at (20, 10).
; PLAN: r0=59(x), r1=85(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x), r6=10(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 59
LDI r1, 85
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 10
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
