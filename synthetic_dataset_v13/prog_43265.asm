; DESCRIPTION: Places a purple line segment connecting (251, 96) to (438, 31).
; PLAN: r0=251(x1), r1=96(y1), r2=438(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 96
LDI r2, 438
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
