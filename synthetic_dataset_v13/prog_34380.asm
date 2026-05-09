; DESCRIPTION: Draws a purple line from (510, 165) to (364, 205).
; PLAN: r0=510(x1), r1=165(y1), r2=364(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 165
LDI r2, 364
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
