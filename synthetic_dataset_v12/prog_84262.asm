; DESCRIPTION: Draws a purple line from (306, 131) to (204, 192).
; PLAN: r0=306(x1), r1=131(y1), r2=204(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 131
LDI r2, 204
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
