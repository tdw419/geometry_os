; DESCRIPTION: Places a purple line segment connecting (238, 143) to (388, 234).
; PLAN: r0=238(x1), r1=143(y1), r2=388(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 143
LDI r2, 388
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
