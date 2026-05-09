; DESCRIPTION: Draws a purple line from (58, 18) to (409, 169).
; PLAN: r0=58(x1), r1=18(y1), r2=409(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 18
LDI r2, 409
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
