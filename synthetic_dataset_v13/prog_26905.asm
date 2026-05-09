; DESCRIPTION: Draws a purple line from (60, 143) to (381, 160).
; PLAN: r0=60(x1), r1=143(y1), r2=381(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 143
LDI r2, 381
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
