; DESCRIPTION: Draws a purple line from (469, 171) to (133, 72).
; PLAN: r0=469(x1), r1=171(y1), r2=133(x2), r3=72(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 171
LDI r2, 133
LDI r3, 72
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
