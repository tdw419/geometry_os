; DESCRIPTION: Draws a purple line from (383, 241) to (234, 145).
; PLAN: r0=383(x1), r1=241(y1), r2=234(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 241
LDI r2, 234
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
