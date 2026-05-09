; DESCRIPTION: Draws a black line from (174, 133) to (427, 137).
; PLAN: r0=174(x1), r1=133(y1), r2=427(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 133
LDI r2, 427
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
