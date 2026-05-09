; DESCRIPTION: Draws a purple line from (353, 57) to (219, 247).
; PLAN: r0=353(x1), r1=57(y1), r2=219(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 57
LDI r2, 219
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
