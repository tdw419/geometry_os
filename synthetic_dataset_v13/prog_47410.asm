; DESCRIPTION: Draws a purple line from (423, 109) to (111, 92).
; PLAN: r0=423(x1), r1=109(y1), r2=111(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 109
LDI r2, 111
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
