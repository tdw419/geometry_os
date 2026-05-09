; DESCRIPTION: Draws a purple line from (336, 223) to (106, 144).
; PLAN: r0=336(x1), r1=223(y1), r2=106(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 223
LDI r2, 106
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
