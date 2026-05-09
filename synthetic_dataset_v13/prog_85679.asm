; DESCRIPTION: Draws a purple line from (328, 37) to (190, 200).
; PLAN: r0=328(x1), r1=37(y1), r2=190(x2), r3=200(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 37
LDI r2, 190
LDI r3, 200
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
