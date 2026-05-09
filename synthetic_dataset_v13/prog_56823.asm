; DESCRIPTION: Draws a purple line from (192, 127) to (289, 245).
; PLAN: r0=192(x1), r1=127(y1), r2=289(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 127
LDI r2, 289
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
