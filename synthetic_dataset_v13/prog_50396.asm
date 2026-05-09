; DESCRIPTION: Draws a purple line from (438, 9) to (424, 98).
; PLAN: r0=438(x1), r1=9(y1), r2=424(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 9
LDI r2, 424
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
