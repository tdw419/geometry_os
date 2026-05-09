; DESCRIPTION: Places a yellow line segment connecting (441, 161) to (378, 145).
; PLAN: r0=441(x1), r1=161(y1), r2=378(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 161
LDI r2, 378
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
