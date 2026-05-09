; DESCRIPTION: Composite: Draws a yellow circle centered at (229, 111) with radius 51 then Sets a single black pixel at (460, 85).
; PLAN: r0=229(x), r1=111(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=460(x), r6=85(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 229
LDI r1, 111
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 460
LDI r6, 85
LDI r7, 0x000000
PSET r5, r6, r7
HALT
