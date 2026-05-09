; DESCRIPTION: Draws a purple line from (109, 20) to (438, 202).
; PLAN: r0=109(x1), r1=20(y1), r2=438(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 20
LDI r2, 438
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
