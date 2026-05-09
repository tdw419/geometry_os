; DESCRIPTION: Places a purple line segment connecting (438, 1) to (431, 195).
; PLAN: r0=438(x1), r1=1(y1), r2=431(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 1
LDI r2, 431
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
