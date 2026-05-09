; DESCRIPTION: Composite: Draws a yellow circle centered at (362, 89) with radius 60 then Sets a single purple pixel at (504, 15).
; PLAN: r0=362(x), r1=89(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=504(x), r6=15(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 362
LDI r1, 89
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 504
LDI r6, 15
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
