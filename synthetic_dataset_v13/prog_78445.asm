; DESCRIPTION: Places a purple line segment connecting (363, 236) to (345, 165).
; PLAN: r0=363(x1), r1=236(y1), r2=345(x2), r3=165(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 236
LDI r2, 345
LDI r3, 165
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
