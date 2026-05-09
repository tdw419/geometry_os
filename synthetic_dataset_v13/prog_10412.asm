; DESCRIPTION: Draws a purple line from (55, 87) to (236, 4).
; PLAN: r0=55(x1), r1=87(y1), r2=236(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 87
LDI r2, 236
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
