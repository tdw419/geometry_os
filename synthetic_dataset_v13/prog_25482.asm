; DESCRIPTION: Draws a purple line from (29, 106) to (376, 177).
; PLAN: r0=29(x1), r1=106(y1), r2=376(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 106
LDI r2, 376
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
