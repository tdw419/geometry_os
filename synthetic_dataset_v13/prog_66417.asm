; DESCRIPTION: Places a red line segment connecting (448, 19) to (322, 202).
; PLAN: r0=448(x1), r1=19(y1), r2=322(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 19
LDI r2, 322
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
