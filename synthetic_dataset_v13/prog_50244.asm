; DESCRIPTION: Composite: Renders a blue line between points (165, 220) and (149, 201) then Sets a single black pixel at (324, 3).
; PLAN: r0=165(x1), r1=220(y1), r2=149(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=3(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 165
LDI r1, 220
LDI r2, 149
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 3
LDI r7, 0x000000
PSET r5, r6, r7
HALT
