; DESCRIPTION: Draws a purple line from (123, 147) to (149, 109).
; PLAN: r0=123(x1), r1=147(y1), r2=149(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 147
LDI r2, 149
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
