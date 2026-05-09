; DESCRIPTION: Draws a purple line from (355, 2) to (213, 218).
; PLAN: r0=355(x1), r1=2(y1), r2=213(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 2
LDI r2, 213
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
