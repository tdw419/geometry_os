; DESCRIPTION: Draws a red line from (378, 89) to (150, 75).
; PLAN: r0=378(x1), r1=89(y1), r2=150(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 89
LDI r2, 150
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
