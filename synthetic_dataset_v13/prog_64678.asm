; DESCRIPTION: Draws a purple line from (177, 113) to (211, 241).
; PLAN: r0=177(x1), r1=113(y1), r2=211(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 113
LDI r2, 211
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
