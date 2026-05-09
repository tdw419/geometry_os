; DESCRIPTION: Draws a purple line from (177, 27) to (484, 221).
; PLAN: r0=177(x1), r1=27(y1), r2=484(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 27
LDI r2, 484
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
