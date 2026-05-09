; DESCRIPTION: Composite: Draws a orange circle centered at (312, 125) with radius 56 then Sets a single red pixel at (35, 100).
; PLAN: r0=312(x), r1=125(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=35(x), r6=100(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 312
LDI r1, 125
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 35
LDI r6, 100
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
