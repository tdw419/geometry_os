; DESCRIPTION: Draws a purple line from (121, 153) to (332, 169).
; PLAN: r0=121(x1), r1=153(y1), r2=332(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 153
LDI r2, 332
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
