; DESCRIPTION: Places a purple line segment connecting (296, 169) to (249, 73).
; PLAN: r0=296(x1), r1=169(y1), r2=249(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 169
LDI r2, 249
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
