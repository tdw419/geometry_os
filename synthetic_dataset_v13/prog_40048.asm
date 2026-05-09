; DESCRIPTION: Composite: Sets a single orange pixel at (217, 89) then Draws a magenta circle centered at (493, 80) with radius 17.
; PLAN: r0=217(x), r1=89(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=493(x), r6=80(y), r7=17(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 217
LDI r1, 89
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 493
LDI r6, 80
LDI r7, 17
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
