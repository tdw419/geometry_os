; DESCRIPTION: Draws a purple line from (33, 10) to (169, 115).
; PLAN: r0=33(x1), r1=10(y1), r2=169(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 10
LDI r2, 169
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
