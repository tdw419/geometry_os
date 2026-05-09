; DESCRIPTION: Draws a red line from (335, 26) to (378, 122).
; PLAN: r0=335(x1), r1=26(y1), r2=378(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 26
LDI r2, 378
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
