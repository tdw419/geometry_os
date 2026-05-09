; DESCRIPTION: Draws a black line from (323, 174) to (38, 181).
; PLAN: r0=323(x1), r1=174(y1), r2=38(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 174
LDI r2, 38
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
