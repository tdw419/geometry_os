; DESCRIPTION: Places a purple line segment connecting (275, 253) to (80, 147).
; PLAN: r0=275(x1), r1=253(y1), r2=80(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 253
LDI r2, 80
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
