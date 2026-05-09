; DESCRIPTION: Composite: Places a yellow circle of radius 57 at center (280, 190) then Sets a single orange pixel at (493, 135).
; PLAN: r0=280(x), r1=190(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=493(x), r6=135(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 280
LDI r1, 190
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 493
LDI r6, 135
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
