; DESCRIPTION: Composite: Renders a blue line between points (487, 77) and (377, 172) then Sets a single orange pixel at (343, 226).
; PLAN: r0=487(x1), r1=77(y1), r2=377(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=343(x), r6=226(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 487
LDI r1, 77
LDI r2, 377
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 226
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
