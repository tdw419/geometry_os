; DESCRIPTION: Draws a purple line from (438, 110) to (190, 193).
; PLAN: r0=438(x1), r1=110(y1), r2=190(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 110
LDI r2, 190
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
