; DESCRIPTION: Composite: Renders a green line between points (433, 155) and (293, 90) then Sets a single magenta pixel at (348, 78).
; PLAN: r0=433(x1), r1=155(y1), r2=293(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=348(x), r6=78(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 433
LDI r1, 155
LDI r2, 293
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 78
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
