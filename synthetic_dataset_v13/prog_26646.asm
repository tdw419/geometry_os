; DESCRIPTION: Draws a purple line from (44, 179) to (463, 35).
; PLAN: r0=44(x1), r1=179(y1), r2=463(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 179
LDI r2, 463
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
