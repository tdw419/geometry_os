; DESCRIPTION: Draws a blue line from (396, 123) to (325, 7).
; PLAN: r0=396(x1), r1=123(y1), r2=325(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 123
LDI r2, 325
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
