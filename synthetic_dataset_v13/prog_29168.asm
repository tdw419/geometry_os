; DESCRIPTION: Composite: Renders a purple line between points (112, 109) and (323, 85) then Places a blue dot at position (427, 35).
; PLAN: r0=112(x1), r1=109(y1), r2=323(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=427(x), r6=35(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 112
LDI r1, 109
LDI r2, 323
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 35
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
