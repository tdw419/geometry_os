; DESCRIPTION: Draws a black line from (147, 227) to (145, 131).
; PLAN: r0=147(x1), r1=227(y1), r2=145(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 227
LDI r2, 145
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
