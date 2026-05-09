; DESCRIPTION: Draws a blue line from (400, 169) to (469, 74).
; PLAN: r0=400(x1), r1=169(y1), r2=469(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 169
LDI r2, 469
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
