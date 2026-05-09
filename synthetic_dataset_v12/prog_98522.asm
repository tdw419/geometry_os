; DESCRIPTION: Composite: Renders a orange line between points (434, 87) and (149, 134) then Sets a single orange pixel at (48, 31).
; PLAN: r0=434(x1), r1=87(y1), r2=149(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=48(x), r6=31(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 434
LDI r1, 87
LDI r2, 149
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 48
LDI r6, 31
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
