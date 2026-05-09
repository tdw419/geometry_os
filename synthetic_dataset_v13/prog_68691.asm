; DESCRIPTION: Draws a purple line from (400, 72) to (13, 148).
; PLAN: r0=400(x1), r1=72(y1), r2=13(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 72
LDI r2, 13
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
