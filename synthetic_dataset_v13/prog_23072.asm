; DESCRIPTION: Composite: Places a yellow dot at position (79, 221) then Renders a blue line between points (124, 201) and (391, 185).
; PLAN: r0=79(x), r1=221(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=124(x1), r6=201(y1), r7=391(x2), r8=185(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 79
LDI r1, 221
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 124
LDI r6, 201
LDI r7, 391
LDI r8, 185
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
