; DESCRIPTION: Renders a black line between points (383, 227) and (147, 81).
; PLAN: r0=383(x1), r1=227(y1), r2=147(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 227
LDI r2, 147
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
