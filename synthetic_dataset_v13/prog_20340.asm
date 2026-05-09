; DESCRIPTION: Draws a purple line from (86, 33) to (453, 131).
; PLAN: r0=86(x1), r1=33(y1), r2=453(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 33
LDI r2, 453
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
