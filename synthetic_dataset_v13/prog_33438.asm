; DESCRIPTION: Draws a purple line from (81, 193) to (389, 65).
; PLAN: r0=81(x1), r1=193(y1), r2=389(x2), r3=65(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 193
LDI r2, 389
LDI r3, 65
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
