; DESCRIPTION: Draws a purple line from (419, 38) to (392, 44).
; PLAN: r0=419(x1), r1=38(y1), r2=392(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 38
LDI r2, 392
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
