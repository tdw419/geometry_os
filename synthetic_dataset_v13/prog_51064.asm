; DESCRIPTION: Draws a red line from (378, 229) to (45, 49).
; PLAN: r0=378(x1), r1=229(y1), r2=45(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 229
LDI r2, 45
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
