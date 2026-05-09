; DESCRIPTION: Draws a purple line from (124, 143) to (299, 100).
; PLAN: r0=124(x1), r1=143(y1), r2=299(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 143
LDI r2, 299
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
