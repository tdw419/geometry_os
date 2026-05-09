; DESCRIPTION: Composite: Places a black dot at position (86, 74) then Renders a purple line between points (122, 201) and (119, 75).
; PLAN: r0=86(x), r1=74(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=122(x1), r6=201(y1), r7=119(x2), r8=75(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 86
LDI r1, 74
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 122
LDI r6, 201
LDI r7, 119
LDI r8, 75
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
