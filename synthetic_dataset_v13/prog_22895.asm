; DESCRIPTION: Draws a purple line from (441, 188) to (31, 106).
; PLAN: r0=441(x1), r1=188(y1), r2=31(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 188
LDI r2, 31
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
