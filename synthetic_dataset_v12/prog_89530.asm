; DESCRIPTION: Draws a purple line from (71, 137) to (112, 156).
; PLAN: r0=71(x1), r1=137(y1), r2=112(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 137
LDI r2, 112
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
