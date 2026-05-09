; DESCRIPTION: Draws a purple line from (25, 58) to (145, 81).
; PLAN: r0=25(x1), r1=58(y1), r2=145(x2), r3=81(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 58
LDI r2, 145
LDI r3, 81
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
