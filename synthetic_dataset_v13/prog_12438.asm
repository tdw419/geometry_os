; DESCRIPTION: Draws a purple line from (68, 77) to (234, 90).
; PLAN: r0=68(x1), r1=77(y1), r2=234(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 77
LDI r2, 234
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
