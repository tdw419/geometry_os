; DESCRIPTION: Draws a black line from (176, 252) to (133, 10).
; PLAN: r0=176(x1), r1=252(y1), r2=133(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 252
LDI r2, 133
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
