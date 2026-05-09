; DESCRIPTION: Draws a purple line from (414, 229) to (227, 24).
; PLAN: r0=414(x1), r1=229(y1), r2=227(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 229
LDI r2, 227
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
