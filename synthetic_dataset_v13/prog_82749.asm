; DESCRIPTION: Places a purple line segment connecting (124, 143) to (492, 79).
; PLAN: r0=124(x1), r1=143(y1), r2=492(x2), r3=79(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 143
LDI r2, 492
LDI r3, 79
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
