; DESCRIPTION: Composite: Creates a red circular shape at (213, 65) with radius 56 then Sets a single purple pixel at (368, 81).
; PLAN: r0=213(x), r1=65(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=368(x), r6=81(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 213
LDI r1, 65
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 368
LDI r6, 81
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
