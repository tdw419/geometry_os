; DESCRIPTION: Draws a yellow line from (323, 112) to (157, 211).
; PLAN: r0=323(x1), r1=112(y1), r2=157(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 112
LDI r2, 157
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
