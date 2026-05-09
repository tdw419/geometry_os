; DESCRIPTION: Draws a purple line from (200, 87) to (416, 192).
; PLAN: r0=200(x1), r1=87(y1), r2=416(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 87
LDI r2, 416
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
