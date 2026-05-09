; DESCRIPTION: Draws a red line from (355, 87) to (441, 10).
; PLAN: r0=355(x1), r1=87(y1), r2=441(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 87
LDI r2, 441
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
