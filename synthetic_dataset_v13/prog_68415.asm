; DESCRIPTION: Draws a purple line from (371, 176) to (124, 130).
; PLAN: r0=371(x1), r1=176(y1), r2=124(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 176
LDI r2, 124
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
