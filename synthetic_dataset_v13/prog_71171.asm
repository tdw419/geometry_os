; DESCRIPTION: Draws a black line from (339, 147) to (149, 173).
; PLAN: r0=339(x1), r1=147(y1), r2=149(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 147
LDI r2, 149
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
