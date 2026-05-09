; DESCRIPTION: Composite: Renders a orange line between points (103, 174) and (188, 251) then Sets a single black pixel at (13, 80).
; PLAN: r0=103(x1), r1=174(y1), r2=188(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=13(x), r6=80(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 103
LDI r1, 174
LDI r2, 188
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 80
LDI r7, 0x000000
PSET r5, r6, r7
HALT
