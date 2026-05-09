; DESCRIPTION: Composite: Renders a orange disk with center (389, 179) and radius 51 then Sets a single red pixel at (440, 16).
; PLAN: r0=389(x), r1=179(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=440(x), r6=16(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 389
LDI r1, 179
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 440
LDI r6, 16
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
