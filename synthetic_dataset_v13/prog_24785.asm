; DESCRIPTION: Draws a purple line from (221, 22) to (336, 186).
; PLAN: r0=221(x1), r1=22(y1), r2=336(x2), r3=186(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 22
LDI r2, 336
LDI r3, 186
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
