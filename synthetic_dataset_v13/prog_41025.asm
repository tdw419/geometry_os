; DESCRIPTION: Composite: Renders a orange line between points (89, 220) and (304, 29) then Sets a single black pixel at (453, 168).
; PLAN: r0=89(x1), r1=220(y1), r2=304(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=453(x), r6=168(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 89
LDI r1, 220
LDI r2, 304
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 168
LDI r7, 0x000000
PSET r5, r6, r7
HALT
