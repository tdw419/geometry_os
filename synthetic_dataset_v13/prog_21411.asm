; DESCRIPTION: Draws a purple line from (338, 106) to (438, 86).
; PLAN: r0=338(x1), r1=106(y1), r2=438(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 106
LDI r2, 438
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
