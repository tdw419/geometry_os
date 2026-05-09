; DESCRIPTION: Draws a yellow line from (441, 169) to (483, 8).
; PLAN: r0=441(x1), r1=169(y1), r2=483(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 169
LDI r2, 483
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
