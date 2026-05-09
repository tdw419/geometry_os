; DESCRIPTION: Composite: Renders a blue line between points (323, 89) and (191, 235) then Places a yellow dot at position (348, 123).
; PLAN: r0=323(x1), r1=89(y1), r2=191(x2), r3=235(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=348(x), r6=123(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 323
LDI r1, 89
LDI r2, 191
LDI r3, 235
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 123
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
