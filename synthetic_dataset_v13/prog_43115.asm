; DESCRIPTION: Places a purple line segment connecting (317, 223) to (441, 160).
; PLAN: r0=317(x1), r1=223(y1), r2=441(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 223
LDI r2, 441
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
