; DESCRIPTION: Composite: Places a white line segment connecting (411, 25) to (315, 123) then Places a yellow dot at position (201, 237).
; PLAN: r0=411(x1), r1=25(y1), r2=315(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=201(x), r6=237(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 411
LDI r1, 25
LDI r2, 315
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 237
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
