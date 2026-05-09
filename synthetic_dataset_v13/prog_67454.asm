; DESCRIPTION: Draws a purple line from (132, 109) to (141, 53).
; PLAN: r0=132(x1), r1=109(y1), r2=141(x2), r3=53(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 109
LDI r2, 141
LDI r3, 53
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
