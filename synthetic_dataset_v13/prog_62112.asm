; DESCRIPTION: Draws a red line from (211, 216) to (378, 170).
; PLAN: r0=211(x1), r1=216(y1), r2=378(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 216
LDI r2, 378
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
