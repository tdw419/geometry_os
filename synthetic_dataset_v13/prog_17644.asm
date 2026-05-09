; DESCRIPTION: Draws a purple line from (323, 242) to (468, 124).
; PLAN: r0=323(x1), r1=242(y1), r2=468(x2), r3=124(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 242
LDI r2, 468
LDI r3, 124
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
