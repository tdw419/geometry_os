; DESCRIPTION: Composite: Draws a black line from (65, 12) to (133, 162) then Sets a single black pixel at (400, 75).
; PLAN: r0=65(x1), r1=12(y1), r2=133(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=75(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 65
LDI r1, 12
LDI r2, 133
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 75
LDI r7, 0x000000
PSET r5, r6, r7
HALT
