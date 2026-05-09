; DESCRIPTION: Places a purple line segment connecting (318, 46) to (433, 169).
; PLAN: r0=318(x1), r1=46(y1), r2=433(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 46
LDI r2, 433
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
