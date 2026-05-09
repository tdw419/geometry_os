; DESCRIPTION: Draws a purple line from (177, 51) to (8, 104).
; PLAN: r0=177(x1), r1=51(y1), r2=8(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 51
LDI r2, 8
LDI r3, 104
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
