; DESCRIPTION: Draws a purple line from (170, 255) to (145, 87).
; PLAN: r0=170(x1), r1=255(y1), r2=145(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 255
LDI r2, 145
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
