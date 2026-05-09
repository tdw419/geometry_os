; DESCRIPTION: Draws a purple line from (22, 233) to (413, 249).
; PLAN: r0=22(x1), r1=233(y1), r2=413(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 233
LDI r2, 413
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
