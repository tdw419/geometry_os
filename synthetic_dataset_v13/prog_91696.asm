; DESCRIPTION: Draws a black line from (100, 254) to (147, 159).
; PLAN: r0=100(x1), r1=254(y1), r2=147(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 254
LDI r2, 147
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
