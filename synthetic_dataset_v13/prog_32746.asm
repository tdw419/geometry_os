; DESCRIPTION: Draws a purple line from (52, 106) to (236, 177).
; PLAN: r0=52(x1), r1=106(y1), r2=236(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 106
LDI r2, 236
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
