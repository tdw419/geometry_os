; DESCRIPTION: Draws a purple line from (451, 248) to (190, 231).
; PLAN: r0=451(x1), r1=248(y1), r2=190(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 248
LDI r2, 190
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
