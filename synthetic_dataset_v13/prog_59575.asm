; DESCRIPTION: Draws a red line from (19, 19) to (391, 201).
; PLAN: r0=19(x1), r1=19(y1), r2=391(x2), r3=201(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 19
LDI r2, 391
LDI r3, 201
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
