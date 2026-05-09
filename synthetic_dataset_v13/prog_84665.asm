; DESCRIPTION: Draws a purple line from (177, 112) to (253, 105).
; PLAN: r0=177(x1), r1=112(y1), r2=253(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 112
LDI r2, 253
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
