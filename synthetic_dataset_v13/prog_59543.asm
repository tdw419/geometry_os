; DESCRIPTION: Draws a purple line from (12, 162) to (83, 245).
; PLAN: r0=12(x1), r1=162(y1), r2=83(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 162
LDI r2, 83
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
