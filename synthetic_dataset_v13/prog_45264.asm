; DESCRIPTION: Composite: Renders a orange line between points (481, 33) and (325, 172) then Sets a single magenta pixel at (472, 199).
; PLAN: r0=481(x1), r1=33(y1), r2=325(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=472(x), r6=199(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 481
LDI r1, 33
LDI r2, 325
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 199
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
