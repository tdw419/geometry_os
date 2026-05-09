; DESCRIPTION: Draws a purple line from (356, 58) to (260, 92).
; PLAN: r0=356(x1), r1=58(y1), r2=260(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 58
LDI r2, 260
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
