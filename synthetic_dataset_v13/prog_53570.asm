; DESCRIPTION: Draws a purple line from (83, 81) to (210, 97).
; PLAN: r0=83(x1), r1=81(y1), r2=210(x2), r3=97(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 81
LDI r2, 210
LDI r3, 97
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
