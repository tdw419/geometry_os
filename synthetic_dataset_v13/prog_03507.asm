; DESCRIPTION: Renders a blue line between points (133, 160) and (432, 248).
; PLAN: r0=133(x1), r1=160(y1), r2=432(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 160
LDI r2, 432
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
