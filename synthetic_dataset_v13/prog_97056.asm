; DESCRIPTION: Draws a purple line from (142, 233) to (106, 177).
; PLAN: r0=142(x1), r1=233(y1), r2=106(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 233
LDI r2, 106
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
