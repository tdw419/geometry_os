; DESCRIPTION: Composite: Renders a red line between points (2, 144) and (85, 48) then Sets a single blue pixel at (282, 41).
; PLAN: r0=2(x1), r1=144(y1), r2=85(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=41(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 2
LDI r1, 144
LDI r2, 85
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 41
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
